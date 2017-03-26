import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.common.util.CrawlerUtils;
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
public class SouhuSearch {


    public static void main(String[] args) {
        String url = "http://so.tv.sohu.com/mts?wd=SEARCH_NAME";
        WebClient client = CrawlerUtils.getClient();
        String content = null;
        String search_name = URLEncoder.encode("奔跑吧");
        url = url.replace("SEARCH_NAME",search_name);
        try {
            content = client.getPage(url).getWebResponse().getContentAsString();

        } catch (FailingHttpStatusCodeException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        Document document= Jsoup.parse(content);
        Elements root=document.select("div[class = ssItem cfix]");
        for (Element element : root){
            Elements ele_info = element.select("div.center h2 a" );
            String souhu_name = ele_info.attr("title");
            String souhu_play_url = "http:" + ele_info.attr("href");
            String souhu_img_url = "http:" + element.select("div.pic img").attr("src");
            System.out.println( souhu_name + souhu_play_url);
            System.out.println(souhu_img_url);
        }
//        System.out.println(root.toString());
    }
}
