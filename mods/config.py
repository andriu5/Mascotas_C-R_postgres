from os import getenv
from os.path import join
from os.path import dirname

from dotenv import load_dotenv

DOTENV_PATH = join(dirname(__file__), '.env')
load_dotenv(DOTENV_PATH)  # take environment variables from .env.

# POSTGRES_HOST = getenv('POSTGRES_HOST', None)
# POSTGRES_USER = getenv('POSTGRES_USER', None)
# POSTGRES_PASS = getenv('POSTGRES_PASS', None)
DB_NAME = getenv('DB_NAME', None)
DB_HOST = getenv('DB_HOST', None)
DB_USER = getenv('DB_USER', None)
DB_PASS = getenv('DB_PASS', None)