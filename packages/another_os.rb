require 'package'

class Another_os < Package
  description 'Install another OS without USB or with internal storage ISO'
  homepage 'https://github.com/Decdec-codelover/Decbrew/'
  version '1.0.0'
  license 'GPL-3'
  compatibility 'all'
  source_url 'https://github.com/Decdec-codelover/Decbrew/archive/another_os-1.0.0.tar.gz'
  source_sha256 'a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8c9d0e1f2'
  binary_compression 'tar.zst'

  binary_sha256({
    aarch64: 'a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8c9d0e1f2',
     armv7l: 'a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8c9d0e1f2',
       i686: 'a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8c9d0e1f2',
     x86_64: 'a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8c9d0e1f2'
  })

  depends_on 'glibc'
  depends_on 'libcap'

  no_compile_needed

  def self.install
    FileUtils.mkdir_p "#{CREW_DEST_PREFIX}/bin"
    FileUtils.mkdir_p "#{CREW_DEST_PREFIX}/lib/another_os"
    FileUtils.mkdir_p "#{CREW_DEST_PREFIX}/share/another_os"
    FileUtils.mkdir_p "#{CREW_DEST_PREFIX}/etc/another_os"

    # Install main executable
    FileUtils.install 'bin/another_os', "#{CREW_DEST_PREFIX}/bin/another_os", mode: 0o755

    # Install library files
    FileUtils.cp_r 'lib/another_os/.', "#{CREW_DEST_PREFIX}/lib/another_os/"

    # Install support files
    FileUtils.cp_r 'share/another_os/.', "#{CREW_DEST_PREFIX}/share/another_os/"

    # Install configuration files
    FileUtils.cp_r 'etc/another_os/.', "#{CREW_DEST_PREFIX}/etc/another_os/"

    # Install man pages
    FileUtils.install 'man/another_os.1.gz', "#{CREW_DEST_MAN_PREFIX}/man1/another_os.1.gz", mode: 0o644 if File.exist?('man/another_os.1.gz')
  end

  def self.postinstall
    puts
    puts 'another_os has been installed successfully!'.lightgreen
    puts
    puts 'Supported Operating Systems:'.lightblue
    puts '  - All Linux Distributions'
    puts '  - Windows 11'
    puts
    puts 'Installation Methods:'.lightblue
    puts '  - USB with unpacked ISO'
    puts '  - Internal storage with ISO'
    puts
    puts 'Usage:'.lightblue
    puts '  another_os --help                    # Show help message'
    puts '  another_os --list-os                 # List supported operating systems'
    puts '  another_os --install-linux <distro> # Install a Linux distribution'
    puts '  another_os --install-windows         # Install Windows 11'
    puts '  another_os --usb <device>            # Use USB device for installation'
    puts '  another_os --storage <path>          # Use internal storage ISO'
    puts
    puts 'Examples:'.lightblue
    puts '  another_os --install-linux ubuntu --usb /dev/sdb'
    puts '  another_os --install-windows --storage /home/user/windows11.iso'
    puts
  end
end
