<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!--  
    int su1 = 3;
    int su2 = 10;
    
    int addResult = add(su1,su2);
    int subResult = subtract(su1,su2);
    
    결과1 : 3 + 10 = 13
    결과2 : 3 - 10 = -7
    -->
    
    <%
	    int su1 = 3;
	    int su2 = 10;
    %>
    <%! 
	    public int add(int a, int b) {
	    	int result = a + b;
	    	return result;
	    }
    
	    public int subtract(int a, int b) {
	    	int result = a - b;
	    	return result;
	    }
    %>
    
    결과 1 : <%=su1%> + <%=su2%> = <%= add(su1,su2)%> 
    <br>
    결과 2 : <%=su1%> - <%=su2%> = <%= subtract(su1,su2)%> 

    
    
