*** Settings ***
# Variables    ../env_files/stage.yml


#contains custom assertion added on top on built in robot libraries
Resource    ../resource_files/Assertions.resource

#contains static test data such as template name and prices
Resource    ../resource_files/ApplicationEnums.resource

#contains test and suite set up and tear down
Resource    ../resource_files/basetest.resource

Resource    ../page_resources/homepage.resource

#builtin robot libraries 
Library          OperatingSystem
Library          String
Library    SeleniumLibrary
Library    Collections
Library    DateTime
Library    FakerLibrary
Library           RequestsLibrary
Library           JSONLibrary


#custom python code files for custom keywords outside of built in robot keywords
# Library    ../custom_python_keywords/test_utils.py
# Library    ../custom_python_keywords/custom_keywords_db.py
# Library    ../custom_python_keywords/custom_keywords_api.py
# Library    ../test_utils/test_utils.py
Library    ../test_utils/test_utils.py
