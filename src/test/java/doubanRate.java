import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.common.util.*;
import com.model.SearchModel;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by rong on 2017/4/11.
 */
public class doubanRate {
    public static void main(String[] args) {
        List douban_rate_list = new ArrayList();
        String url = "https://movie.douban.com/j/search_subjects?type=tv&tag=%E7%83%AD%E9%97%A8&sort=recommend&page_limit=20";
//        String ss = URLEncoder.encode(search_name);
//        url = url.replace("SEARCH_NAME",ss);
        String content = null;
        try {
            content = new com.common.util.HttpsGetData(url,null).Do();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Document document= Jsoup.parse(content);
//        System.out.println(content);
        JSONObject root = JSONObject.parseObject(content);
        JSONArray jsonArray = root.getJSONArray("subjects");

        for (int i = 0 ; i< jsonArray.size(); i++){
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            String douban_img_url = jsonObject.getString("cover");
            String rate = jsonObject.getString("rate");
            String title = jsonObject.getString("title");
            String douban_url = jsonObject.getString("url");
            System.out.println(rate + title + douban_url);
            System.out.println(douban_img_url);
        }
    }
}
