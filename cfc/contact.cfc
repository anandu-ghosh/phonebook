component entityname="contacts" persistent="true" table="contact_number" {

	property name="id" column="id" fieldtype="id" generator="increment";
	property name="UserId" column="user_id" fieldtype="id";
    property name="Title" column="title" ormtype="text";
    property name="FirstName" column="fname" ormtype="text";
    property name="LastName" column="lname" ormtype="text";
    property name="Gender" column="gender" ormtype="text";
    property name="DateBirth" column="dob" ormtype="date";
    property name="Image" column="image" ormtype="text";
    property name="Address" column="address" ormtype="text";
    property name="Street" column="street" ormtype="text";
    property name="Email" column="email" ormtype="text";
    property name="Phone" column="phone" ormtype="text";
}

