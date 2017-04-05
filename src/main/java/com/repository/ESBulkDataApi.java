//package com.repository;
//
//import org.elasticsearch.action.search.SearchResponse;
//import org.elasticsearch.action.search.SearchType;
//import org.elasticsearch.client.Client;
//import org.elasticsearch.client.transport.TransportClient;
//import org.elasticsearch.common.settings.Settings;
//import org.elasticsearch.common.transport.InetSocketTransportAddress;
//import org.elasticsearch.common.unit.TimeValue;
//import org.elasticsearch.index.query.QueryBuilder;
//import org.elasticsearch.index.query.QueryBuilders;
//import org.elasticsearch.search.SearchHit;
//
///**
// * Created by rong on 2017/4/4.
// */
//public class ESBulkDataApi {
//
//    public static void main(String[] args) {
//        // establish the client
//        Settings settings = Settings.settingsBuilder()
//                .put("cluster.name", "genbank").build();
//        @SuppressWarnings("resource")
//        Client client = new TransportClient(settings)
//                .addTransportAddress(new InetSocketTransportAddress(
//                        "10.0.26.1", 9300));
//        QueryBuilder queryBuilder = QueryBuilders.boolQuery().must(
//                QueryBuilders.matchAllQuery());
//
//        SearchResponse searchResponse = client.prepareSearch("liu")
//                .setTypes("seqs").setSearchType(SearchType.SCAN)
//                .setScroll(new TimeValue(60000)).setQuery(queryBuilder)
//                .setSize(100).execute().actionGet();
//
//        //scroll to get the data
//        while (true) {
//
//            searchResponse = client
//                    .prepareSearchScroll(searchResponse.getScrollId())
//                    .setScroll(new TimeValue(600000)).execute().actionGet();
//
//
//            for (SearchHit hit : searchResponse.getHits().getHits()) {
//                // copy the data to the new index
//
//                client.prepareIndex("my_index_v1", "seqs", hit.getId())
//                        .setSource(hit.getSourceAsString()).execute().actionGet();
//            }
//
//            // when there is no data,break the loop
//            if (searchResponse.getHits().getHits().length == 0) {
//                break;
//            }
//
//        }
//    }
//
//}