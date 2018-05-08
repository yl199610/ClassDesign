package com.yl.cd.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.yl.cd.entity.Cbook;

public class ExcelUtil {
	 @SuppressWarnings("static-access")
	   private static String getValue(HSSFCell hssfCell) {
	           if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
	               // 返回布尔类型的值
	               return String.valueOf(hssfCell.getBooleanCellValue());
	           } else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
	               // 返回数值类型的值
	               return String.valueOf(hssfCell.getNumericCellValue());
	           } else {
	               // 返回字符串类型的值
	               return String.valueOf(hssfCell.getStringCellValue());
	           }
	       }
	    public static  List<Cbook> readXls() throws IOException {
	        InputStream is = new FileInputStream("d:/book1.xls");
	        HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
	        Cbook bean = null;
	        List<Cbook> list = new ArrayList<Cbook>();
	        // 循环工作表Sheet
	        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
	            HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
	            if (hssfSheet == null) {
	                continue;
	            }
	            // 循环行Row
	            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
	                HSSFRow hssfRow = hssfSheet.getRow(rowNum);
	                if (hssfRow != null) {
	                    bean = new Cbook();
	                    HSSFCell cbidd = hssfRow.getCell(0);
	                    HSSFCell cauthor = hssfRow.getCell(1);
	                    HSSFCell cimage = hssfRow.getCell(2);
	                    HSSFCell cisbn = hssfRow.getCell(3);
	                    HSSFCell bookname = hssfRow.getCell(4);
	                    HSSFCell cpublishing = hssfRow.getCell(5);
	                    HSSFCell cpublishtime = hssfRow.getCell(6);
	                    HSSFCell cwordnumber = hssfRow.getCell(7);
	                    HSSFCell ctotalpage = hssfRow.getCell(8);
	                    HSSFCell cintroduce = hssfRow.getCell(9);
	                    HSSFCell catalogue = hssfRow.getCell(10);
	                    HSSFCell edition = hssfRow.getCell(11);
	                    HSSFCell cbfree = hssfRow.getCell(12);
	                    
	                    bean.setCbidd(getValue(cbidd));
	                    bean.setCauthor(getValue(cauthor));
	                    bean.setCimage(getValue(cimage));
	                    bean.setCisbn(getValue(cisbn));
	                    bean.setBookname(getValue(bookname));
	                    bean.setCpublishing(getValue(cpublishing));
	                    bean.setCpublishtime(getValue(cpublishtime));
	                    bean.setCwordnumber(getValue(cwordnumber));
	                    bean.setCtotalpage(getValue(ctotalpage));
	                    bean.setCintroduce(getValue(cintroduce));
	                    bean.setCatalogue(getValue(catalogue));
	                    bean.setEdition(getValue(edition));
	                    bean.setCbfree(getValue(cbfree));
	                    list.add(bean);
	                }
	            }
	        }
	        return list;
	    }
	//测试
	  public static void main(String[] args) {
	      try {
	          int i = 0;
	        for (Cbook u : readXls()) {
	            System.out.println(u.toString());
	            i++;
	        }
	        System.out.println(i);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	  }
}