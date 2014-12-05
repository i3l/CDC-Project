FHIR Server with HealthVault and Greenway Support

FHIR Resources:
Patient
Observation
Condition

Support for Healthvault  PHR offline access (only 1 authorization required-- 
user doesn't have to log in each time in order for information to be accessed)

Example calls:
http://taurus.i3l.gatech.edu:8080/CDCWebApp/fhir/Patient
http://taurus.i3l.gatech.edu:8080/CDCWebApp/fhir/Observation?subject:Patient=2
http://taurus.i3l.gatech.edu:8080/CDCWebApp/fhir/Condition?subject:Patient=2