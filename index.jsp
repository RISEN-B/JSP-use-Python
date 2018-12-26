<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.io.BufferedReader" %>
<%@ page import = "java.io.InputStreamReader" %>
<%@ page import = "java.util.ArrayList" %>

<%
class Exec
{
    private ArrayList list = new ArrayList();
    public void usePython() throws Exception
    {
    	String a = "";
	String[] arg = new String[]{"python3", request.getRealPath("/") + "test.py"};
	Process pr = Runtime.getRuntime().exec(arg);

	BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream()));
        String line;

        while ((line = in.readLine()) != null) {
            list.add(line);
        }
        in.close();
		pr.waitFor();
    }
    
    public ArrayList out()
    {
        return list;
    }
}
%>

<%
Exec exec = new Exec();
exec.usePython();

out.println("<h3>随机生成6~16位密钥，内容如下：</h3>");
%>

<%= exec.out() %>

<br /><br /><%= "当前地址：" + request.getScheme() +  "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + request.getServletPath() %>
