pkg_name=jsonschema
pkg_distname=${pkg_name}
pkg_version=2.6.0
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="An implementation of JSON Schema validation for Python"
pkg_upstream_url=http://github.com/Julian/jsonschema
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/j/jsonschema/${pkg_dirname}.tar.gz
pkg_shasum=6ff5f3180870836cae40f06fa10419f557208175f13ad7bc26caa77beb1f6e02
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
