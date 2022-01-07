package socket;
import java.text.SimpleDateFormat;
import java.util.Date;

public class socketInfo implements Runnable {
	public static final String SERVER_IP = "172.30.1.53"; //변경 필요 (정석 컴퓨터 IP)
	public static final int ORDER_PORT = 7777;

	@Override
	public void run() {
		
	}
	
	public String getTime() {
		SimpleDateFormat f = new SimpleDateFormat("[hh:mm:ss]");
		return f.format(new Date());
	}
	
}
