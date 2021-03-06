pkg_name=asn1crypto
pkg_distname=${pkg_name}
pkg_version=0.22.0
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python ASN.1 library with a focus on performance and a \
pythonic API"
pkg_upstream_url=https://github.com/wbond/asn1crypto
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/a/asn1crypto/${pkg_dirname}.tar.gz
pkg_shasum=cbbadd640d3165ab24b06ef25d1dca09a3441611ac15f6a6b452474fdf0aed1a
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
