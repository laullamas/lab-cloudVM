#! /usr/bin/bash

# For installing software on the VM instance, in the SSH session, update the Debian package list running the following command:

sudo apt-get update

# To install Python development tools and virtual environment support, execute the following command:
# Note: python3-venv includes pip automatically when you create a virtual environment, so no separate pip installation is needed

sudo apt-get install -y python3-venv python3-dev build-essential

# Create a Python virtual environment to avoid externally-managed-environment errors:
# (Modern Debian/Ubuntu systems prevent pip installations at system level for security)

python3 -m venv myenv

# Activate the virtual environment:

source myenv/bin/activate

# Verify that pip is available in the virtual environment (it's installed automatically with venv):

pip --version

# Install FastAPI and Uvicorn inside the virtual environment using pip:

pip install fastapi "uvicorn[standard]"

# Verify uvicorn installation:

uvicorn --version

# The output provides the version of uvicorn that you installed.

# With that, you have FastAPI and Uvicorn installed in an isolated environment and are ready to use them.
# FastAPI is the framework you'll use to build your API, and Uvicorn is the server that will use the API you build to serve requests.

# To run the FastAPI application, you must use the uvicorn binary from the virtual environment:
# sudo ~/myenv/bin/uvicorn main:app --reload --host=0.0.0.0 --port 80

# Note: Using sudo with the full path to uvicorn (~/myenv/bin/uvicorn) ensures the application runs 
# with elevated privileges on port 80 while using the packages installed in the virtual environment.
