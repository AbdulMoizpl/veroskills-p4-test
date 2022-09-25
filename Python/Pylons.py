import os


from mako.lookup import TemplateLookup
from genshi.template import TemplateLoader
from jinja2 import ChoiceLoader, Environment, FileSystemLoader
from pylons.configuration import PylonsConfig
from pylons.error import handle_mako_error

import projectname.lib.app_globals as app_globals
if not sys.platform.startswith('java'):
    tests_require.extend(['Genshi', 'coverage>=2.85'])

setup(
    name="Pylons",
    version=version,
    description='Pylons Web Framework',
    long_description="""
Pylons