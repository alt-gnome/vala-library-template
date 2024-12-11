project(
  '<<LIB-NAME>>',
  'vala',
  version: '0.1.0',
  meson_version: '>= 1.0.0',
  license: 'GPL-3.0-or-later',
)

api_version = '0.1'

lib_name = 'lib' + meson.project_name ()
gir_name = '<<GIR-NAME>>'

versioned_name = meson.project_name() + '-' + api_version
versioned_lib_name = lib_name + '-' + api_version
versioned_gir_name = gir_name + '-' + api_version

deps_name = versioned_lib_name + '.deps'
header_name = versioned_name + '.h'
vapi_name = versioned_lib_name + '.vapi'
gir_name = versioned_gir_name + '.gir'
typelib_name = versioned_gir_name + '.typelib'

lib_url = ''

glib_min_version = '2.76'

pkgconfig = import('pkgconfig')
gnome = import('gnome')

deps_pkgs = [
  'glib-2.0',
]

glib_dep = dependency('glib-2.0')

dependencies = [
  glib_dep,
]

# Need for subprojects libraries
pkgconfig_requires = dependencies

add_project_arguments(
  '-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name()),
  '-DDATADIR="@0@"'.format(get_option('prefix') + get_option('datadir')),
  # GCC14 COMPILE ERROR
  '-Wno-int-conversion',
  language: ['c'],
)

add_project_arguments(
  '--abi-stability',
  '--hide-internal',
  '--target-glib', glib_min_version,
  '--vapidir', meson.current_source_dir(),
  language: ['vala'],
)

subdir('lib')

if get_option('documentation')
  subdir('doc')
endif

gnome.post_install()
