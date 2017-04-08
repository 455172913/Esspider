import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.Page;
import com.gargoylesoftware.htmlunit.RefreshHandler;
import com.gargoylesoftware.htmlunit.WebClient;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * Created by rong on 2017/4/8.
 */
public class sohuList {
    public static void main(String[] args) {
        String url = "http://tv.sohu.com/rank/china_tv.shtml";
        WebClient webClient = new WebClient();
        webClient.getOptions().setJavaScriptEnabled(true);
        webClient.getOptions().setCssEnabled(false);
        webClient.getOptions().setAppletEnabled(false);
        webClient.setRefreshHandler(new RefreshHandler() {
            public void handleRefresh(Page page, URL url, int seconds) throws IOException {
            }
        });
        webClient.addRequestHeader("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13");

        String content = null;
        try {
            Page page = webClient.getPage(url);
            content =  page.getWebResponse().getContentAsString();
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
        Element root = document.select("div.rList_subCon").get(0);
        Elements days = root.select("ul[class=rList] li");
        for (int i = 0; i<days.size();i++){
            Element element = days.get(i);
//            System.out.println(element);
            Elements ele_name = element.select("div.vName a");
            Elements ele_count = element.select("span.vTotal");
            String souhu_name = ele_name.attr("title");
            String souhu_play_url = ele_name.attr("href");
            String souhu_count = ele_count.text();
            System.out.println(souhu_name + ":" +souhu_count);
            System.out.println("第" + i+1 + "个" + souhu_play_url);
        }
    }
}
