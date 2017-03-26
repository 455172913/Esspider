import com.common.util.CrawlerUtils;
import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.net.MalformedURLException;

/**
 * Created by rong on 2017/3/22.
 */
public class IqiyiSearch {
    public static void main(String[] args) {
        String url = "http://so.iqiyi.com/so/q_SEARCH_NAME";
        url = url.replace("SEARCH_NAME","火影忍者");
        WebClient client = CrawlerUtils.getClient();
        String content = null;
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
        Elements root = document.select("ul.mod_result_list li.list_item");
        int i = 0;
        for (Element element : root){
            Elements ele_infos = element.select("div[class=result_info result_info-auto result_info-180236]");
            if (!StringUtils.isEmpty(ele_infos.toString())){
                Elements ele_imgs = element.select("a img");
                Elements ele_name = ele_infos.select("h3.result_title a");

                String iqiyi_name = ele_name.attr("title");
                String iqiyi_play_url = ele_name.attr("href");
                String iqiyi_img = ele_imgs.attr("src");
                System.out.println(iqiyi_name);
                System.out.println(iqiyi_play_url);
                System.out.println(iqiyi_img);
            }
        }

    }
}
