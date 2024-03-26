<<<<<<< Updated upstream
{ pkgs, ... }:

{
  # Python packages
  home.packages = with pkgs.python3Packages; [
      cffi
      dbus-python
      wheel
      pyyaml
      zipp
      xlib
      libvirt
      pybind11
      pyatspi
      attrs
      autocommand
      bcrypt
      pycairo
      certifi
      chardet
      click
      cryptography
      cssselect
      python-dateutil
      distro
      dnspython
      evdev
      ewmh
      fastjsonschema
      fido2
      python-gnupg
      pygobject3
      idna
      importlib-metadata
      inflect
      isodate
      jeepney
      keyring
      lxml
      markdown
      markupsafe
      more-itertools
      numpy
      ordered-set
      packaging
      pillow
      pip
      platformdirs
      ply
      prettytable
      proton-client
      protonvpn-nm-lib
      psutil
      pulsectl
      pycparser
      pycups
      pycurl
      pydantic
      pyinotify
      pyopenssl
      pyparsing
      pyqt5
      pyqt5_sip
      pyscard
      pythondialog
      pyxdg
      rdflib
      requests
      secretstorage
      setproctitle
      setuptools
      six
      systemd
      tomli
      urllib3
      wcwidth
      websockets
      python-zbar
  ];
}
=======
{ config, pkgs, ... }:

{
  # Python packages
  home.packages = with pkgs.python3Packages; [
      cffi
      dbus-python
      wheel
      pyyaml
      zipp
      xlib
      libvirt
      pybind11
      pyatspi
      attrs
      autocommand
      bcrypt
      pycairo
      certifi
      chardet
      click
      cryptography
      cssselect
      python-dateutil
      distro
      dnspython
      evdev
      ewmh
      fastjsonschema
      fido2
      python-gnupg
      pygobject3
      idna
      importlib-metadata
      inflect
      isodate
      jeepney
      keyring
      lxml
      markdown
      markupsafe
      more-itertools
      numpy
      ordered-set
      packaging
      pillow
      pip
      platformdirs
      ply
      prettytable
      proton-client
      protonvpn-nm-lib
      psutil
      pulsectl
      pycparser
      pycups
      pycurl
      pydantic
      pyinotify
      pyopenssl
      pyparsing
      pyqt5
      pyqt5_sip
      pyscard
      pythondialog
      pyxdg
      rdflib
      requests
      secretstorage
      setproctitle
      setuptools
      six
      systemd
      tomli
      urllib3
      wcwidth
      websockets
      python-zbar
  ];
}
>>>>>>> Stashed changes
