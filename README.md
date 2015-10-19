#### repo: https://github.com/drhuffman12/sample_vet_off_sched

# Sample Rails application for managing a veterinary practice.

Given I am the owner of a veterinary practice:

  1. As the owner of the veterinary practice, I have two additional veterinary doctors Bob and Susan. I should be able to track the following information about my fellow veterinary doctors and myself.
    1. Name: must be no longer than 35 characters; value is required
    2. Address
    3. City
    4. State
    5. Zip: should be at most 5 digits
    6. School Received Degree From
    7. Years in Practice: must be value between 1 and 100

  2. As the receptionist of the veterinary practice, I should be able to schedule an appointment for a customer's pet with a specific veterinary doctor. The appointment should contain the following information
    1. Date of Visit: date cannot be in the past; value is required
    2. Pet: required
    3. Customer: required
    4. Requires Reminder of Appointment
    5. Reason for Visit: required

  3. As one of the practicing veterinary doctors, I should be able to record the following information about a customer's pet.
    1. Name of Pet: required, no more than 35 characters
    2. Type of Pet: must be a dog, cat, or bird
    3. Breed: required, no more than 35 characters
    4. Age: required
    5. Weight: required
    6. Date of Last Visit: required

  4. As a customer, I should be able to see when my pet is scheduled for their next appointment.
    1. Pet's Name
    2. Date of Next Appointment
    3. Reason for Visit

Some logins are generated via 'db/seed.rb' (rake db:seed). They are all given initial passwords of '12345678'; but, of course, you'd want to handle passwords otherwise for a real deployment. The logins for these users are:

  * cust1@nowhere.com
  * cust2@nowhere.com
  * dr1@nowhere.com
  * dr2@nowhere.com
  * admin@nowhere.com
  * recept@nowhere.com
