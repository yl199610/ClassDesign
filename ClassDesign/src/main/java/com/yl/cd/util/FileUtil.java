package com.yl.cd.util;

import java.io.File;

public class FileUtil {
	private FileUtil() {
	}
	// 读取文件
	public static File read(String path) {
		return new File(path);
	}
}
