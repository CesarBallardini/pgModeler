# -*- mode: ruby -*-
# vi: set ft=ruby :

PGMODELER_VERSION="1.1.3"

VAGRANTFILE_API_VERSION = "2"

HOSTNAME = "pgModeler"
HOST_IP_ADDRESS="192.168.11.10"
DOMAIN="virtual.ballardini.com.ar"
VM_NUM_CPUS=3
VM_RAM="4096"


$msg = <<MSG
------------------------------------------------------
Compile pgModeler version #{PGMODELER_VERSION} from tarball source

You can run the program using:

   vagrant  ssh -c /usr/local/bin/pgmodeler

------------------------------------------------------
MSG

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if Vagrant.has_plugin?("vagrant-hostmanager")
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.manage_guest = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true

    # we use cachier + NFS only if hostmanager manages the names on /etc/hosts in the host
    if Vagrant.has_plugin?("vagrant-cachier")
      # Configure cached packages to be shared between instances of the same base box.
      # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
      config.cache.scope = :box

      config.cache.synced_folder_opts = {
        owner: "_apt",
        group: "_apt",
        # group: "vagrant",
        mount_options: ["dmode=777", "fmode=666"]
      }
   end

  end

 config.vm.post_up_message = $msg

 config.vm.define HOSTNAME do |srv|

    srv.vm.box = "ubuntu/noble64"

    srv.vm.network :private_network, ip: HOST_IP_ADDRESS
#    config.vm.network "forwarded_port", guest_ip: "127.0.0.1", guest: 8080, host: 8080

    srv.vm.box_check_update = false
    srv.ssh.forward_agent = true
    srv.ssh.forward_x11 = true
    srv.vm.hostname = HOSTNAME

    if Vagrant.has_plugin?("vagrant-hostmanager")
      srv.hostmanager.aliases = %W(#{HOSTNAME+"."+DOMAIN})
    end

    srv.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.cpus = VM_NUM_CPUS
      vb.memory = VM_RAM
      # https://www.virtualbox.org/manual/ch08.html#vboxmanage-modifyvm mas parametros para personalizar en VB
    end
  end

    ##
    # Provisioning
    #
    config.vm.provision "fix-no-tty", type: "shell" do |s|  # http://foo-o-rama.com/vagrant--stdin-is-not-a-tty--fix.html
        s.privileged = false
        s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
    end
    config.vm.provision "ssh_pub_key", type: :shell do |s|
      begin
          ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
          s.inline = <<-SHELL
            mkdir -p /root/.ssh/
            touch /root/.ssh/authorized_keys
            echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
            echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
          SHELL
      rescue
          puts "No public keys availables on host HOME"
          s.inline = "echo OK no public keys available"
      end
    end

    config.vm.provision "update", type: "shell" do |s|
        s.privileged = false
        s.inline = <<-SHELL
          export DEBIAN_FRONTEND=noninteractive
          export APT_LISTCHANGES_FRONTEND=none
          export APT_OPTIONS=' -y --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dpkg::Options::=--force-confdef -o Dpkg::Options::=--force-confold '

          sudo -E apt-get update -y -qq > /dev/null 2>&1
          sudo -E apt-get install apt-utils ${APT_OPTIONS} > /dev/null 2>&1
          sudo -E apt-get install debconf-utils ${APT_OPTIONS} > /dev/null 2>&1

          echo 'tzdata tzdata/Areas select America' | sudo -E debconf-set-selections
          echo 'tzdata tzdata/Zones/America select Argentina/Buenos_Aires' | sudo -E debconf-set-selections
          sudo -E rm -f /etc/timezone /etc/localtime
          sudo -E apt-get install tzdata ${APT_OPTIONS} > /dev/null 2>&1

          sudo -E apt-get --purge remove apt-listchanges -y > /dev/null 2>&1
          sudo dpkg-reconfigure --frontend=noninteractive libc6 > /dev/null 2>&1
          [ $( lsb_release -is ) != "Debian" ] && sudo -E apt-get install linux-image-generic ${APT_OPTIONS}
          sudo -E apt-get upgrade ${APT_OPTIONS} > /dev/null 2>&1
          sudo -E apt-get dist-upgrade ${APT_OPTIONS} > /dev/null 2>&1
          sudo -E apt-get autoremove -y > /dev/null 2>&1
          sudo -E apt-get autoclean -y > /dev/null 2>&1
          sudo -E apt-get clean > /dev/null 2>&1

          # https://sleeplessbeastie.eu/2021/01/06/how-to-fix-multipath-daemon-error-about-missing-path-when-using-virtualbox/
          cat - | sudo tee /etc/multipath.conf  <<!EOF
defaults {
  user_friendly_names yes
}
blacklist {
  device {
    vendor "VBOX"
    product "HARDDISK"
  }
}
!EOF

          sudo systemctl restart multipathd.service

        SHELL
    end

    config.vm.provision "1_install_requirements", type: :shell, path: "provision/1-install-requirements.sh", privileged: false
    config.vm.provision "2_install_source_code",  type: :shell, path: "provision/2-install-source-code.sh", privileged: false, args: [ PGMODELER_VERSION ]
    config.vm.provision :reload
    config.vm.provision "3_compile_and_install",  type: :shell, path: "provision/3-compile-and-install.sh", privileged: false, args: [ VM_NUM_CPUS ]
    config.vm.provision "4_cleanup",              type: :shell, path: "provision/4-cleanup.sh", privileged: false

end

