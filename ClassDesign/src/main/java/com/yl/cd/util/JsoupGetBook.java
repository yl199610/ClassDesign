package com.yl.cd.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.yl.cd.entity.Cproduct;

public class JsoupGetBook {
	public static List<Cproduct> getTopMsg() {
		Document document = null;
		List<Cproduct> cproductList = new ArrayList<Cproduct>();
		try {
			document = Jsoup.connect("http://www.bookschina.com/").ignoreContentType(true).data("query", "Java")
					.userAgent("Mozilla").cookie("auth", "token").timeout(3000).get();
			Elements divClass = document.getElementsByClass("hotCon").get(0).getElementsByClass("on").get(0).getElementsByTag("li");
			for (int i = 0; i < divClass.size(); i++) {
				String redCurList = divClass.get(i).getElementsByTag("i").get(0).html();
				String bookNameList = divClass.get(i).getElementsByTag("p").get(0).html();
				String imgList = divClass.get(i).getElementsByTag("img").get(0).attr("src");
				String sellPriceList = divClass.get(i).getElementsByClass("sellPrice").get(0).html();
				String priceList = divClass.get(i).getElementsByClass("price").get(0).html();
//				System.out.println(redCurList+"====\n"+bookNameList+"====\n"+imgList+"====\n"+sellPriceList+"====\n"+priceList);
				Cproduct cproduct=new Cproduct();
				cproduct.setCimage(imgList);
				cproduct.setCnormalprice(priceList);
				cproduct.setCwsscprice(sellPriceList);
				cproduct.setCproductname(bookNameList);
				cproduct.setCdescription(redCurList);
				cproductList.add(cproduct);
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return cproductList;
	}
}
