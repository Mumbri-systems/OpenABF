%global commit 21ba301b3f9d460e03c979230c70aebaa053b3fe
%global shortcommit %(c=%{commit}; echo ${c:0:7})
%global version_literal 2.1.0-rc.1
%global commitdate 20260428
%global debug_package %{nil}

Name:     openabf
Version:  2.1.0~rc.1^%{commitdate}git%{shortcommit}
Release:  %autorelease
Summary:  A single-header C++ library of angle-based flattening algorithms
License:  Apache-2.0
URL:      https://github.com/educelab/OpenABF
Source:   https://github.com/Mumbri-systems/OpenABF/archive/%{commit}/%{name}-%{shortcommit}.tar.gz
Patch1:   tests-use-system-gtest.patch

BuildRequires: cmake
BuildRequires: gcc-c++
BuildRequires: eigen3-devel
BuildRequires: doxygen
BuildRequires: gtest-devel
BuildRequires: gmock-devel
BuildRequires: perl
BuildRequires: git
BuildRequires: texlive-latex
BuildRequires: texlive-bibtex
BuildRequires: texlive-xcolor
BuildRequires: texlive-newunicodechar
BuildRequires: texlive-dvips
BuildRequires: ghostscript

%package devel
Summary: Development files for %{name}
Provides: openabf-static = %{version}-%{release}
BuildArch: noarch

%package doc
Summary: Documentation for %{name}
BuildArch: noarch

%description
OpenABF is a single-header C++ library of angle-based flattening algorithms.
The template interface is designed for simple out-of-the-box use, and
integration with existing geometric processing pipelines is quick and easy.

%description devel
Development and header files for OpenABF.

%description doc
Documentation for OpenABF using doxygen.

%prep
%autosetup -n OpenABF-%{commit} -p1


%build
%cmake \
    -DOPENABF_BUILD_DOCS=ON \
    -DOPENABF_BUILD_TESTS=ON \
    -DDOXYGEN_GENERATE_DOCBOOK=YES\
    -DDOXYGEN_GENERATE_HTML=NO
%cmake_build
%cmake_build --target docs

%install
%cmake_install
install -d %{buildroot}%{_docdir}/%{name}/docbook/
cp -r %{_vpath_builddir}/docs/docbook/. %{buildroot}%{_docdir}/%{name}/docbook/

%check
%ctest

%files devel
%doc README.md
%license LICENSE
%license NOTICE
%dir %{_includedir}/OpenABF
%{_includedir}/OpenABF/OpenABF.hpp
%{_datadir}/cmake/OpenABF/

%files doc
%doc README.md
%license LICENSE
%license NOTICE
%dir %{_docdir}/%{name}
%doc %{_docdir}/%{name}/docbook/


%changelog
%autochangelog
