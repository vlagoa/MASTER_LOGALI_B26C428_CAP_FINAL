using {SalesOrdersService as st} from '../salesorders-service';

annotate st.Status with {
    @title : 'Status'
    code @Common : {
        Text           : name,
        TextArrangement: #TextOnly
    }

};