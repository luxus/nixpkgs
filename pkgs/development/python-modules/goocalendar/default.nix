{ lib
, fetchPypi
, buildPythonPackage
, pkg-config
, gtk3
, gobject-introspection
, pygobject3
, goocanvas2
, isPy3k
 }:

buildPythonPackage rec {
  pname = "GooCalendar";
  version = "0.8.0";

  disabled = !isPy3k;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-LwL5TLRkD6ALucabLUeB0k4rIX+O/aW2ebS2rZPjIUs=";
  };

  nativeBuildInputs = [
    pkg-config
    gobject-introspection
  ];

  propagatedBuildInputs = [
    pygobject3
  ];

  buildInputs = [
    gtk3
    goocanvas2
  ];

  # No upstream tests available
  doCheck = false;

  meta = with lib; {
    description = "A calendar widget for GTK using PyGoocanvas.";
    homepage = "https://goocalendar.tryton.org/";
    changelog = "https://foss.heptapod.net/tryton/goocalendar/-/blob/${version}/CHANGELOG";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ udono ];
  };
}
