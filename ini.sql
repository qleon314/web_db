#
# Table structure for table `MD_Table`
#

DROP TABLE IF EXISTS MD_Table;
CREATE TABLE MD_Table (
  MD_TableID int(11) NOT NULL default '0',
  RealName varchar(64) default NULL,
  DisplayName varchar(250) default NULL,
  PRIMARY KEY  (MD_TableID)
);

#
# Data for table `MD_Table`
#

INSERT INTO MD_Table VALUES (1, 'Customers', 'customer');
INSERT INTO MD_Table VALUES (2, 'Suppliers', 'supplier');
INSERT INTO MD_Table VALUES (3, 'Orders', 'order');
INSERT INTO MD_Table VALUES (4, 'Shippers', 'shipper');
INSERT INTO MD_Table VALUES (5, 'Products', 'product');
INSERT INTO MD_Table VALUES (6, 'Employees', 'employee');
INSERT INTO MD_Table VALUES (7, 'Order_Details', 'order detail');
INSERT INTO MD_Table VALUES (8, 'Categories', 'category');

# --------------------------------------------------------

#
# Table structure for table `MD_Attribute`
#

DROP TABLE IF EXISTS MD_Attribute;
CREATE TABLE MD_Attribute (
  MD_AttributeID int(11) NOT NULL default '0',
  MD_TableID int(11) NOT NULL default '0',
  RealName varchar(64) default NULL,
  DisplayName varchar(250) default NULL,
  PRIMARY KEY  (MD_AttributeID)
);

#
# Data for table `MD_Attribute`
#

#Customers
INSERT INTO MD_Attribute VALUES (1, 1, 'CustomerID', 'customer ID');
INSERT INTO MD_Attribute VALUES (2, 1, 'CompanyName', 'company name');
INSERT INTO MD_Attribute VALUES (3, 1, 'ContactName', 'contact name');
INSERT INTO MD_Attribute VALUES (4, 1, 'ContactTitle', 'contact title');
INSERT INTO MD_Attribute VALUES (5, 1, 'Address', 'address');
INSERT INTO MD_Attribute VALUES (6, 1, 'City', 'city');
INSERT INTO MD_Attribute VALUES (7, 1, 'Region', 'region');
INSERT INTO MD_Attribute VALUES (8, 1, 'PostalCode', 'postal code');
INSERT INTO MD_Attribute VALUES (9, 1, 'Country', 'country');
INSERT INTO MD_Attribute VALUES (10, 1, 'Phone', 'phone');
INSERT INTO MD_Attribute VALUES (11, 1, 'Fax', 'fax');
#Suppliers
INSERT INTO MD_Attribute VALUES (12, 2, 'SupplierID', 'supplier ID');
INSERT INTO MD_Attribute VALUES (13, 2, 'CompanyName', 'company name');
INSERT INTO MD_Attribute VALUES (14, 2, 'ContactName', 'contact name');
INSERT INTO MD_Attribute VALUES (15, 2, 'ContactTitle', 'contact title');
INSERT INTO MD_Attribute VALUES (16, 2, 'Address', 'address');
INSERT INTO MD_Attribute VALUES (17, 2, 'City', 'city');
INSERT INTO MD_Attribute VALUES (18, 2, 'Region', 'region');
INSERT INTO MD_Attribute VALUES (19, 2, 'PostalCode', 'postal code');
INSERT INTO MD_Attribute VALUES (20, 2, 'Country', 'country');
INSERT INTO MD_Attribute VALUES (21, 2, 'Phone', 'phone');
INSERT INTO MD_Attribute VALUES (22, 2, 'Fax', 'fax');
INSERT INTO MD_Attribute VALUES (23, 2, 'Homepage', 'homepage');
#Orders
INSERT INTO MD_Attribute VALUES (24, 3, 'OrderID', 'order ID');
INSERT INTO MD_Attribute VALUES (25, 3, 'CustomerID', 'customer ID');
INSERT INTO MD_Attribute VALUES (26, 3, 'EmployeeID', 'employee ID');
INSERT INTO MD_Attribute VALUES (27, 3, 'Freight', 'freight');
INSERT INTO MD_Attribute VALUES (28, 3, 'ShipName', 'ship name');
INSERT INTO MD_Attribute VALUES (29, 3, 'ShipAddress', 'ship address');
INSERT INTO MD_Attribute VALUES (30, 3, 'ShipCity', 'ship city');
INSERT INTO MD_Attribute VALUES (31, 3, 'ShipRegion', 'ship region');
INSERT INTO MD_Attribute VALUES (32, 3, 'ShipPostalCode', 'ship postal code');
INSERT INTO MD_Attribute VALUES (33, 3, 'ShipCountry', 'ship country');
INSERT INTO MD_Attribute VALUES (34, 3, 'ShipperID', 'shipper id');
INSERT INTO MD_Attribute VALUES (35, 3, 'OrderDate', 'order date');
INSERT INTO MD_Attribute VALUES (36, 3, 'RequiredDate', 'required date');
INSERT INTO MD_Attribute VALUES (37, 3, 'ShippedDate', 'shipped date');
#Shippers
INSERT INTO MD_Attribute VALUES (38, 4, 'ShipperID', 'shipper id');
INSERT INTO MD_Attribute VALUES (39, 4, 'CompanyName', 'company name');
INSERT INTO MD_Attribute VALUES (40, 4, 'Phone', 'phone');
#Products
INSERT INTO MD_Attribute VALUES (41, 5, 'ProductID', 'product ID');
INSERT INTO MD_Attribute VALUES (42, 5, 'ProductName', 'product name');
INSERT INTO MD_Attribute VALUES (43, 5, 'SupplierID', 'supplier id');
INSERT INTO MD_Attribute VALUES (44, 5, 'CategoryID', 'category id');
INSERT INTO MD_Attribute VALUES (45, 5, 'QuantityPerUnit', 'quantity per unit');
INSERT INTO MD_Attribute VALUES (46, 5, 'UnitPrice', 'unit price');
INSERT INTO MD_Attribute VALUES (47, 5, 'UnitsInStock', 'units in stock');
INSERT INTO MD_Attribute VALUES (48, 5, 'UnitsOnOrder', 'units on order');
INSERT INTO MD_Attribute VALUES (49, 5, 'ReorderLevel', 'recorder level');
INSERT INTO MD_Attribute VALUES (50, 5, 'Discontinued', 'discontinued');
#Employees
INSERT INTO MD_Attribute VALUES (51, 6, 'EmployeeID', 'employee id');
INSERT INTO MD_Attribute VALUES (52, 6, 'LastName', 'last name');
INSERT INTO MD_Attribute VALUES (53, 6, 'FirstName', 'first name');
INSERT INTO MD_Attribute VALUES (54, 6, 'Title', 'title');
INSERT INTO MD_Attribute VALUES (55, 6, 'TitleOfCourtesy', 'title of courtesy');
INSERT INTO MD_Attribute VALUES (56, 6, 'Address', 'address');
INSERT INTO MD_Attribute VALUES (57, 6, 'City', 'city');
INSERT INTO MD_Attribute VALUES (58, 6, 'Region', 'region');
INSERT INTO MD_Attribute VALUES (59, 6, 'PostalCode', 'postal code');
INSERT INTO MD_Attribute VALUES (60, 6, 'Country', 'country');
INSERT INTO MD_Attribute VALUES (61, 6, 'HomePhone', 'home phone');
INSERT INTO MD_Attribute VALUES (62, 6, 'Extension', 'extension');
INSERT INTO MD_Attribute VALUES (63, 6, 'Photo', 'photo');
INSERT INTO MD_Attribute VALUES (64, 6, 'Notes', 'notes');
INSERT INTO MD_Attribute VALUES (65, 6, 'ReportsTo', 'reports to');
INSERT INTO MD_Attribute VALUES (66, 6, 'BirthDate', 'birth date');
INSERT INTO MD_Attribute VALUES (67, 6, 'HireDate', 'hire date');
#Order_Details
INSERT INTO MD_Attribute VALUES (68, 7, 'OrderID', 'order id');
INSERT INTO MD_Attribute VALUES (69, 7, 'ProductID', 'product id');
INSERT INTO MD_Attribute VALUES (70, 7, 'UnitPrice', 'unit price');
INSERT INTO MD_Attribute VALUES (71, 7, 'Quantity', 'quantity');
INSERT INTO MD_Attribute VALUES (72, 7, 'Discount', 'discount');
#Categories
INSERT INTO MD_Attribute VALUES (73, 8, 'CategoryID', 'category id');
INSERT INTO MD_Attribute VALUES (74, 8, 'CategoryName', 'category name');
INSERT INTO MD_Attribute VALUES (75, 8, 'Description', 'description');
INSERT INTO MD_Attribute VALUES (76, 8, 'Picture', 'picture');

# --------------------------------------------------------

#
# Table structure for table `MD_Join`
#

DROP TABLE IF EXISTS MD_Join;
CREATE TABLE MD_Join (
  MD_JoinID int(11) NOT NULL default '0',
  Table1Name varchar(64) default NULL,
  Table2Name varchar(64) default NULL,
  Table1Key varchar(64) default NULL,
  Table2Key varchar(64) default NULL,
  PRIMARY KEY  (MD_JoinID)
);

#
# Data for table `MD_Join`
#

INSERT INTO MD_Join VALUES (1, 'Customers', 'Orders', 'CustomerID', 'CustomerID');
INSERT INTO MD_Join VALUES (2, 'Shippers', 'Orders', 'ShipperID', 'ShipperID');
INSERT INTO MD_Join VALUES (3, 'Employees', 'Orders', 'EmployeeID', 'EmployeeID');
INSERT INTO MD_Join VALUES (4, 'Order_Details', 'Orders', 'OrderID', 'OrderID');
INSERT INTO MD_Join VALUES (5, 'Suppliers', 'Products', 'SupplierID', 'SupplierID');
INSERT INTO MD_Join VALUES (6, 'Order_Details', 'Products', 'ProductID', 'ProductID');
INSERT INTO MD_Join VALUES (7, 'Categories', 'Products', 'CategoryID', 'CategoryID');

# --------------------------------------------------------

#
# Table structure for table `MD_Constraint`
#

DROP TABLE IF EXISTS MD_Constraint;
CREATE TABLE MD_Constraint (
  MD_ConstraintID int(11) NOT NULL default '0',
  RealName varchar(64) default NULL,
  DisplayName varchar(250) default NULL,
  PRIMARY KEY  (MD_ConstraintID)
);

#
# Data for table `MD_Constraint`
#

INSERT INTO MD_Constraint VALUES(1, 'LIKE', 'is like');
INSERT INTO MD_Constraint VALUES(2, 'NOT LIKE', 'is not like');
INSERT INTO MD_Constraint VALUES(3, '=', 'is equal to');
INSERT INTO MD_Constraint VALUES(4, '<>', 'is not equal to');
INSERT INTO MD_Constraint VALUES(5, '>=', 'is not smaller than');
INSERT INTO MD_Constraint VALUES(6, '<=', 'is not greater than');
INSERT INTO MD_Constraint VALUES(7, '<', 'is smaller than');
INSERT INTO MD_Constraint VALUES(8, '>', 'is greater than');
INSERT INTO MD_Constraint VALUES(9, 'BETWEEN', 'is between');
INSERT INTO MD_Constraint VALUES(10, 'IN', 'is in');

# --------------------------------------------------------