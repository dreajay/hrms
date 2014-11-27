package com.hrms.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;



@Component("poiExport")
public class PoiExport {

	public InputStream exportExcel(String fileName, String[] headTitle,
			List<String> list) throws IOException {

		Workbook wb = new HSSFWorkbook();
		//FileOutputStream fileOut = new FileOutputStream(fileName);
		HSSFCellStyle style = (HSSFCellStyle) wb.createCellStyle();
		
		// 设置这些样式
		style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		// 生成一个字体
		HSSFFont font = (HSSFFont) wb.createFont();
		font.setColor(HSSFColor.VIOLET.index);
		font.setFontHeightInPoints((short) 12);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);

		// 把字体应用到当前的样式
		style.setFont(font);
		// 创建工作簿
		Sheet sheet = wb.createSheet("sheet1");
		// sheet.setDefaultColumnWidth((short)15);

		// 创建头部
		Row row = sheet.createRow((short) 0);
		for (int i = 0; i < headTitle.length; i++) {
			row.createCell(i).setCellValue(headTitle[i]);
		}
		// 填充数据
		for (int i = 0; i < list.size(); i++) {
			Row r = sheet.createRow((short) (i + 1));
			String[] strArray = list.get(i).split(",");
			for (int j = 0; j < headTitle.length; j++) {
				r.createCell(j).setCellValue(strArray[j]);
				if (strArray[j].length()>3) {
					sheet.setColumnWidth((short)j, 5000);
				}
			}
			
		}
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try {
			wb.write(baos);
		} catch (IOException e) {
			e.printStackTrace();
		}
		byte[] ba = baos.toByteArray();
		ByteArrayInputStream excelStream = new ByteArrayInputStream(ba);
		return excelStream;

	}

	/*
	 * public void exportExcel(Collection<T> dataset, OutputStream out) {
	 * 
	 * }
	 */
	/*
	 * public void exportExcel(String[] headers, Collection<T>
	 * dataset,OutputStream out,String pattern) {
	 * 
	 * HSSFWorkbook workbook = new HSSFWorkbook();
	 * 
	 * // 生成一个表格
	 * 
	 * HSSFSheet sheet = workbook.createSheet("系统日志");
	 * 
	 * // 设置表格默认列宽度为15个字节
	 * 
	 * //sheet.setDefaultColumnWidth((short) 15); // 生成一个样式
	 * 
	 * HSSFCellStyle style = workbook.createCellStyle();
	 * 
	 * // 设置这些样式
	 * 
	 * style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
	 * 
	 * style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	 * 
	 * style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	 * 
	 * style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	 * 
	 * style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	 * 
	 * style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	 * 
	 * style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	 * 
	 * // 生成一个字体
	 * 
	 * HSSFFont font = workbook.createFont();
	 * 
	 * font.setColor(HSSFColor.VIOLET.index);
	 * 
	 * font.setFontHeightInPoints((short) 12);
	 * 
	 * font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	 * 
	 * // 把字体应用到当前的样式
	 * 
	 * style.setFont(font);
	 * 
	 * // 生成并设置另一个样式
	 * 
	 * HSSFCellStyle style2 = workbook.createCellStyle();
	 * 
	 * style2.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
	 * 
	 * style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	 * 
	 * style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	 * 
	 * style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	 * 
	 * style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
	 * 
	 * style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
	 * 
	 * style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	 * 
	 * style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	 * 
	 * // 生成另一个字体
	 * 
	 * HSSFFont font2 = workbook.createFont();
	 * 
	 * font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
	 * 
	 * // 把字体应用到当前的样式
	 * 
	 * style2.setFont(font2);
	 * 
	 * 
	 * 
	 * // 声明一个画图的顶级管理器
	 * 
	 * HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
	 * 
	 * // 定义注释的大小和位置,详见文档
	 * 
	 * HSSFComment comment = patriarch.createComment(new HSSFClientAnchor(0, 0,
	 * 0, 0, (short) 4, 2, (short) 6, 5));
	 * 
	 * // 设置注释内容
	 * 
	 * comment.setString(new HSSFRichTextString("可以在POI中添加注释！"));
	 * 
	 * // 设置注释作者，当鼠标移动到单元格上是可以在状态栏中看到该内容.
	 * 
	 * comment.setAuthor("leno");
	 * 
	 * 
	 * 
	 * //产生表格标题行
	 * 
	 * HSSFRow row = sheet.createRow(0);
	 * 
	 * for (short i = 0; i < headers.length; i++) {
	 * 
	 * HSSFCell cell = row.createCell(i);
	 * 
	 * cell.setCellStyle(style);
	 * 
	 * HSSFRichTextString text = new HSSFRichTextString(headers[i]);
	 * 
	 * cell.setCellValue(text);
	 * 
	 * }
	 * 
	 * Iterator<T> it = dataset.iterator();
	 * 
	 * int index = 0;
	 * 
	 * while (it.hasNext()) {
	 * 
	 * index++;
	 * 
	 * row = sheet.createRow(index);
	 * 
	 * T t = (T) it.next();
	 * 
	 * //利用反射，根据javabean属性的先后顺序，动态调用getXxx()方法得到属性值
	 * 
	 * Field[] fields = t.getClass().getDeclaredFields();
	 * 
	 * for (short i = 0; i < fields.length; i++) {
	 * 
	 * HSSFCell cell = row.createCell(i);
	 * 
	 * cell.setCellStyle(style2);
	 * 
	 * Field field = fields[i];
	 * 
	 * String fieldName = field.getName();
	 * 
	 * String getMethodName = "get"
	 * 
	 * + fieldName.substring(0, 1).toUpperCase()
	 * 
	 * + fieldName.substring(1);
	 * 
	 * try {
	 * 
	 * Class tCls = t.getClass();
	 * 
	 * Method getMethod = tCls.getMethod(getMethodName,
	 * 
	 * new Class[] {});
	 * 
	 * Object value = getMethod.invoke(t, new Object[] {});
	 * 
	 * //判断值的类型后进行强制类型转换
	 * 
	 * String textValue = null;
	 * 
	 * // if (value instanceof Integer) {
	 * 
	 * // int intValue = (Integer) value;
	 * 
	 * // cell.setCellValue(intValue);
	 * 
	 * // } else if (value instanceof Float) {
	 * 
	 * // float fValue = (Float) value;
	 * 
	 * // textValue = new HSSFRichTextString(
	 * 
	 * // String.valueOf(fValue));
	 * 
	 * // cell.setCellValue(textValue);
	 * 
	 * // } else if (value instanceof Double) {
	 * 
	 * // double dValue = (Double) value;
	 * 
	 * // textValue = new HSSFRichTextString(
	 * 
	 * // String.valueOf(dValue));
	 * 
	 * // cell.setCellValue(textValue);
	 * 
	 * // } else if (value instanceof Long) {
	 * 
	 * // long longValue = (Long) value;
	 * 
	 * // cell.setCellValue(longValue);
	 * 
	 * // }
	 * 
	 * if (value instanceof Boolean) {
	 * 
	 * boolean bValue = (Boolean) value;
	 * 
	 * textValue = "男";
	 * 
	 * if (!bValue) {
	 * 
	 * textValue ="女";
	 * 
	 * }
	 * 
	 * } else if (value instanceof Date) {
	 * 
	 * Date date = (Date) value;
	 * 
	 * SimpleDateFormat sdf = new SimpleDateFormat(pattern);
	 * 
	 * textValue = sdf.format(date);
	 * 
	 * } else if (value instanceof byte[]) {
	 * 
	 * // 有图片时，设置行高为60px;
	 * 
	 * row.setHeightInPoints(60);
	 * 
	 * // 设置图片所在列宽度为80px,注意这里单位的一个换算
	 * 
	 * sheet.setColumnWidth(i, (short) (35.7 * 80));
	 * 
	 * // sheet.autoSizeColumn(i);
	 * 
	 * byte[] bsValue = (byte[]) value;
	 * 
	 * HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0,
	 * 
	 * 1023, 255, (short) 6, index, (short) 6, index);
	 * 
	 * anchor.setAnchorType(2);
	 * 
	 * patriarch.createPicture(anchor, workbook.addPicture(
	 * 
	 * bsValue, HSSFWorkbook.PICTURE_TYPE_JPEG));
	 * 
	 * } else{
	 * 
	 * //其它数据类型都当作字符串简单处理
	 * 
	 * textValue = value.toString();
	 * 
	 * }
	 * 
	 * //如果不是图片数据，就利用正则表达式判断textValue是否全部由数字组成
	 * 
	 * if(textValue!=null){
	 * 
	 * Pattern p = Pattern.compile("^\\d+(\\.\\d+)?$");
	 * 
	 * Matcher matcher = p.matcher(textValue);
	 * 
	 * if(matcher.matches()){
	 * 
	 * //是数字当作double处理
	 * 
	 * cell.setCellValue(Double.parseDouble(textValue));
	 * 
	 * }else{
	 * 
	 * HSSFRichTextString richString = new HSSFRichTextString(textValue);
	 * 
	 * HSSFFont font3 = workbook.createFont();
	 * 
	 * font3.setColor(HSSFColor.BLUE.index);
	 * 
	 * richString.applyFont(font3);
	 * 
	 * cell.setCellValue(richString);
	 * 
	 * }
	 * 
	 * }
	 * 
	 * } catch (SecurityException e) {
	 * 
	 * // TODO Auto-generated catch block
	 * 
	 * e.printStackTrace();
	 * 
	 * } catch (NoSuchMethodException e) {
	 * 
	 * // TODO Auto-generated catch block
	 * 
	 * e.printStackTrace();
	 * 
	 * } catch (IllegalArgumentException e) {
	 * 
	 * // TODO Auto-generated catch block
	 * 
	 * e.printStackTrace();
	 * 
	 * } catch (IllegalAccessException e) {
	 * 
	 * // TODO Auto-generated catch block
	 * 
	 * e.printStackTrace();
	 * 
	 * } catch (InvocationTargetException e) {
	 * 
	 * // TODO Auto-generated catch block
	 * 
	 * e.printStackTrace();
	 * 
	 * } finally {
	 * 
	 * //清理资源
	 * 
	 * }
	 * 
	 * }
	 * 
	 * 
	 * 
	 * }
	 * 
	 * try {
	 * 
	 * workbook.write(out);
	 * 
	 * } catch (IOException e) {
	 * 
	 * e.printStackTrace();
	 * 
	 * }
	 * 
	 * }
	 */

	/*
	 * public void exportExcel(String[] headers, Collection<T>
	 * dataset,OutputStream out) {
	 * 
	 * }
	 */

}