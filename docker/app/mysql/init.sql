-- Tenancy setup
CREATE USER IF NOT EXISTS tenancy@localhost IDENTIFIED BY 'tenancy';
GRANT ALL PRIVILEGES ON *.* TO tenancy@localhost WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO laravel@localhost WITH GRANT OPTION;
