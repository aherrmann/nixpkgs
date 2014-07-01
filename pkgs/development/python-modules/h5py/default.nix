{ stdenv, fetchurl, python, buildPythonPackage, numpy, hdf5, cython }:

buildPythonPackage rec {
  name = "h5py-2.3.1";

  src = fetchurl {
    url = "https://pypi.python.org/packages/source/h/h5py/${name}.tar.gz";
    md5 = "8f32f96d653e904d20f9f910c6d9dd91";
  };

  setupPyBuildFlags = ["--hdf5=${hdf5}"];
  setupPyInstallFlags = ["--hdf5=${hdf5}"];

  buildInputs = [ hdf5 cython ];
  propagatedBuildInputs = [ numpy ];

  doCheck = true;

  meta = {
    description = "
      The h5py package is a Pythonic interface to the HDF5 binary data format.
    ";
    homepage = "http://www.h5py.org/";
    license = stdenv.lib.licenses.bsd2;
  };
}
