using {SalesOrdersService as c} from '../salesorders-service';

annotate c.Countries with {
    @title : 'Countries'
    code @Common : {
        Text           : name,
        TextArrangement: #TextOnly
    }

};