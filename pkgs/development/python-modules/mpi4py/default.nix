{ stdenv, fetchurl, python, buildPythonPackage, mpi }:

buildPythonPackage rec {
  name = "mpi4py-1.3.1";

  src = fetchurl {
    url = "https://bitbucket.org/mpi4py/mpi4py/downloads/${name}.tar.gz";
    sha256 = "e7bd2044aaac5a6ea87a87b2ecc73b310bb6efe5026031e33067ea3c2efc3507";
  };

  setupPyBuildFlags = ["--mpicc=${mpi}/bin/mpicc"];

  buildInputs = [ mpi ];

  meta = {
    description = "
      Provides Python bindings for the Message Passing Interface standard.
    ";
    homepage = "http://code.google.com/p/mpi4py/";
    license = stdenv.lib.licenses.bsd3;
  };
}
