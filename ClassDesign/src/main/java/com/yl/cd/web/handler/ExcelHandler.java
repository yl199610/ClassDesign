package com.yl.cd.web.handler;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yl.cd.entity.Cbook;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.service.BookService;
import com.yl.cd.util.ExcelUtil;

@Controller
@RequestMapping(value = "/report")
public class ExcelHandler {
	@Autowired
	private BookService bookService;

	/**
	 * 导入管养数据
	 */
	@ResponseBody
	@RequestMapping(value = "/import")
	public String importCatedata(@RequestParam("file") MultipartFile file) {
		LogManager.getLogger().debug("请求ExcelHandler处理excel的导入......" + file.getOriginalFilename());
		int num = 0;
		int total = 0;
		List<Cbook> ci;
		try {
			ci = ExcelUtil.readXls();
			for (Cbook u : ci) {
				boolean flag = bookService.addBook(u);
				if(flag){
					num++;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("有" + num + "条数据插入成功");
		return String.valueOf(total + "=" + num);
	}

	/**
	 * 导出报表
	 */
	@RequestMapping(value = "/export")
	@ResponseBody
	public void export(String page, String rows, Cbook cbook, HttpServletRequest request,
			HttpServletResponse response) {
		LogManager.getLogger().debug("请求ExcelHandler处理excel的导出......");
		// 获取数据
		PaginationBean<Cbook> bookPage = bookService.getAllBook(page, rows, cbook);
		List<Cbook> list = bookPage.getRows();
		// 创建一个Excel文件
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 创建一个工作表
		HSSFSheet sheet = workbook.createSheet("图书信息表");
		// 添加表头行
		HSSFRow hssfRow = sheet.createRow(0);
		// 设置单元格格式居中
		HSSFCellStyle cellStyle = workbook.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		// 添加表头内容
		HSSFCell headCell = hssfRow.createCell(0);
		headCell.setCellValue("图书名称");
		headCell.setCellStyle(cellStyle);

		headCell = hssfRow.createCell(1);
		headCell.setCellValue("作者");
		headCell.setCellStyle(cellStyle);

		headCell = hssfRow.createCell(2);
		headCell.setCellValue("ISBN");
		headCell.setCellStyle(cellStyle);

		headCell = hssfRow.createCell(3);
		headCell.setCellValue("出版社");
		headCell.setCellStyle(cellStyle);
		headCell = hssfRow.createCell(4);
		headCell.setCellValue("出版时间");
		headCell.setCellStyle(cellStyle);
		headCell = hssfRow.createCell(5);
		headCell.setCellValue("字数");
		headCell.setCellStyle(cellStyle);
		// 添加数据内容
		for (int i = 0; i < list.size(); i++) {
			hssfRow = sheet.createRow((int) i + 1);
			Cbook cbook1 = list.get(i);

			// 创建单元格，并设置值
			HSSFCell cell = hssfRow.createCell(0);
			cell.setCellValue(cbook1.getBookname());
			cell.setCellStyle(cellStyle);

			cell = hssfRow.createCell(1);
			cell.setCellValue(cbook1.getCauthor());
			cell.setCellStyle(cellStyle);

			cell = hssfRow.createCell(2);
			cell.setCellValue(cbook1.getCisbn());
			cell.setCellStyle(cellStyle);

			cell = hssfRow.createCell(3);
			cell.setCellValue(cbook1.getCpublishing());
			cell.setCellStyle(cellStyle);

			cell = hssfRow.createCell(4);
			cell.setCellValue(cbook1.getCpublishtime());
			cell.setCellStyle(cellStyle);

			cell = hssfRow.createCell(5);
			cell.setCellValue(cbook1.getCwordnumber());
			cell.setCellStyle(cellStyle);
		}

		// 保存Excel文件
		try {
			OutputStream outputStream = new FileOutputStream("D:/book.xls");
			workbook.write(outputStream);
			outputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
