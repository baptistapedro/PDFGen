FROM fuzzers/libfuzzer:12.0

RUN apt-get update
RUN apt install -y build-essential wget git clang cmake  automake autotools-dev  libtool zlib1g zlib1g-dev libexif-dev
RUN  wget https://github.com/Kitware/CMake/releases/download/v3.20.1/cmake-3.20.1.tar.gz
RUN  git clone https://github.com/AndreRenaud/PDFGen.git
WORKDIR /PDFGen
COPY file:b3713724117c7ea01fa8fb419e89e36aef70ffd3267a4eee02be9c33759e0abd in . 
RUN clang++ -fsanitize=fuzzer,address fuzz.cpp -o /x pdfgen.c

ENTRYPOINT []
CMD ["/x"]
