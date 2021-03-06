{stdenv, fetchurl}:
stdenv.mkDerivation rec {
  name = "nauty-${version}";
  version = "26r11";
  src = fetchurl {
    url = "http://pallini.di.uniroma1.it/nauty${version}.tar.gz";
    sha256 = "05z6mk7c31j70md83396cdjmvzzip1hqb88pfszzc6k4gy8h3m2y";
  };
  buildInputs = [];
  installPhase = ''
    mkdir -p "$out"/{bin,share/doc/nauty}

    cp $(find . -type f -perm -111 \! -name '*.*' ) "$out/bin"
    cp [Rr][Ee][Aa][Dd]* COPYRIGHT This* [Cc]hange* "$out/share/doc/nauty"
  '';
  meta = {
    inherit version;
    description = ''Programs for computing automorphism groups of graphs and digraphs'';
    license = stdenv.lib.licenses.asl20;
    maintainers = [stdenv.lib.maintainers.raskin];
    platforms = stdenv.lib.platforms.linux;
    homepage = http://pallini.di.uniroma1.it/;
  };
}
