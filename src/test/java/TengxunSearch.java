import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URLEncoder;

/**
 * Created by rong on 2017/3/21.
 */
public class TengxunSearch {
    public static void main(String[] args) {
        String url = "https://v.qq.com/x/search/?q=SEARCH_NAME";
        String ss = URLEncoder.encode("火影忍者");
        url = url.replace("SEARCH_NAME",ss);
        String content = null;
        try {
            content = new HttpsGetData(url,null).Do();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Document document= Jsoup.parse(content);
//        System.out.println(content);
        Elements root=document.select("div[class=_infos]");
        for (Element element : root){
            Elements ele_name = element.select("h2 a");
            Elements ele_img = element.select("a img");

            String tengxun_name = ele_name.text();
            String tengxun_play_url = ele_name.attr("href");
            String tengxun_img_url = "http:" + ele_img.attr("src");
            System.out.println(tengxun_name + tengxun_play_url);
            System.out.println(tengxun_img_url);
        }
//        System.out.println(root.toString());
    }
}
