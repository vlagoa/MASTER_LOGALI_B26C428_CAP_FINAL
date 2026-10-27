using {com.salesorders as entities} from '../db/schema';

service SalesOrdersService {

    entity SalesOrdersHeader     as projection on entities.SalesOrderHeader;
    entity SalesOrderItems as projection on entities.SalesOrderItems;

    @readonly
    entity Countries       as projection on entities.Countries;

    @readonly
    entity Status          as projection on entities.Status;

};
