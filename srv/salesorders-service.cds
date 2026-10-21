using {com.salesorders as entities } from '../db/schema';

service SaleorderSercice {
    entity SalesOrderHeader as projection on entities.SalesOrderHeader;
    entity SalesOrderItems  as projection on entities.SalesOrderItems;
    
     @readonly entity Countries as projection on entities.Countries;
    };

