<%--
 Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--%>
<html>
  <head>
    <title>JSP 2.0 Expression Language - Basic Arithmetic</title>
  </head>
  <body>
    <h1>JSP 2.0 Expression Language - Basic Arithmetic</h1>
    <hr>
    This example illustrates basic Expression Language arithmetic.
    Addition (+), subtraction (-), multiplication (*), division (/ or div),
    and modulus (% or mod) are all supported.  Error conditions, like
    division by zero, are handled gracefully.
    <br>
<%

String nombre = null;

nombre = "Mau";


out.println(request.getServerName());
out.println(request.getServerPort());

%>
	<br>
	Mi nombre en HTML es <%=nombre%>
  </body>
</html>
