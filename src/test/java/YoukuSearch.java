import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.common.util.CrawlerUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.net.MalformedURLException;

/**
 * Created by rong on 2017/3/20.
 */
public class YoukuSearch {
    public static void main(String[] args) {
        String url = "http://www.soku.com/search_video/q_SEARCH_NAME";
        url = url.replace("SEARCH_NAME","猎人");
        WebClient client = CrawlerUtils.getClient();
        String content = null;
        try {
            System.out.println(url);
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
        Elements root=document.select("div.DIR div.s_dir");
        for (Element element : root){
            Elements ele_name = element.select("div.s_detail h2.base_name");
            Elements ele_url = element.select("div.s_detail h2.base_name a");
            String youku_play_url = ele_url.attr("href");
            String youku_img_url = element.select("div.s_target img").attr("src");
            if (youku_play_url.contains("detail")){
                youku_play_url = "http://www.soku.com"+youku_play_url;
            }
            String name = ele_name.text();
            System.out.println(name);
            System.out.println(youku_play_url);
            System.out.println(youku_img_url);
        }
//        System.out.println(root.toString());
    }
}
