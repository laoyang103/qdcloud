package cn.gatherlife.wms.business.vo;

public class T1 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Runtime rt = Runtime.getRuntime();
		Process p = null;
		try{
			p =rt.exec(new String[]{"D:/Program Files/EditPlus/EditPlus.exe ","d:/111.txt"});
			System.out.println("成功打开软件和文件！");
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
