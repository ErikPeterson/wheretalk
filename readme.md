#WhereDoc

WhereDoc is a tool for doctors and patients. It allows doctors that are a part of the service to register a profile, their specialties, their location, their insurers, and their current schedule. Doctors can use the tool to track their schedule, and their availability is automatically updated. Patients can can enter a location, an insurer, and the type of doctor they're looking for. WhereDoc will provide them with a map of the closest doctors with available appointments. Patients can optionally enter preferred weekly times for appointments, which will further filter their results.

In order to scope the app, and to ensure HIPAA compliance, the app stores no identifying data on patients or any patient records. Patients use the site anonymously and are given contact information for the doctor of their choice. Doctor's schedules are stored simply as time blocks within an abstract "week" in order to determine availability. 

Backend Models:

	Users (Doctors)
		- Name
		- Specialty
		- Bio
		- Location
		- Photo
		Schedule
			Days
				Appointments
