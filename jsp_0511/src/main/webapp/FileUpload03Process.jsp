<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-11
    Time: 오후 2:35
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.apache.commons.fileupload.*" %>  <%--  아파치 방식 파일 업로드  --%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.fileupload.DiskFileUpload" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>

<%--  Commons-FileUpload 라이브러리  --%>
<%--  서버의 메모리상에서 파일 처리가 가능하도록 지원하는 라이브러리  --%>
<%--  commons-io, commons-fileupload 라이브러리 2개가 동시에 있어야 동작함  --%>

<%--  DiskFileUpload 클래스  --%>
<%--  setRepositoryPath(경로) : 업로드된 파일이 저장될 폴더 설정  --%>
<%--  setSizeMax(크기) : 최대 파일 크기 설정  --%>
<%--  setSizeThreshold(크기) : 메모리 상에 저장할 최대 크기 설정  --%>
<%--  parseRequest(request객체) : multipart/form-data 유형의 요청 파라미터를 가져옴  --%>

<%--  FileItem 클래스  --%>
<%--  isFormField() : 요청 파라미터의 타입을 확인하여 file 인지 아닌지 구분, 일반 데이터일 경우 true  --%>
<%--  getFieldName() : 요청 파라미터의 이름 가져오기  --%>
<%--  getString() : 기본 문자 인코딩을 통해서 사용자 요청 파라미터의 값 가져오기  --%>
<%--  getString(인코딩) : 지정한 문자 인코딩을 통해서 사용자 요청 파라미터의 값 가져오기  --%>
<%--  getName() : 업로드된 파일의 이름을 가져오기, 경로 포함  --%>
<%--  getSize() : 업로드된 파일의 크기 가져오기  --%>
<%--  get() : 업로드된 파일을 배열로 모두 가져오기  --%>
<%--  isInMemory() : 업로드된 파일이 메모리에 저장될 경우 true, 임시 디렉토리에 저장 시 false  --%>
<%--  delete() : 파일과 관련된 자원을 삭제, 메모리에 저장된 경우 메모리를 반환, 파일로 저장했을 경우 파일 삭제  --%>
<%--  write() : 파일과 관련된 자원을 저장  --%>
<%--  getContentType() : 클라이언트에서 전송한 데이터의 유형을 출력, 정의되지 않았을 경우 null  --%>

<div class="container">
    <%
        String fileUploadPath = "C:\\upload";

        /* 클라이언트에서 전송된 request 정보를 읽어올 DiskFileUpload 클래스 타입의 객체 생성 */
        DiskFileUpload upload = new DiskFileUpload();
        /* parseRequest() 메소드를 사용하여 request에 저장된 내용 읽기 */
        List items = upload.parseRequest(request);

        /* 받아온 내용을 반복 가능한 객체인 Iterator 객체에 저장 */
        Iterator params = items.iterator();

        while (params.hasNext()) {
            /* 클라이언트에서 전송한 내용 1개를 가져옴 */
            FileItem fileItem = (FileItem) params.next();

            /* isFormField() 메소드로 일반 input 태그의 정보인지 file 정보인지 확인(일반 input 태그 일떄만 true file 정보일땐 false) */
            if (!fileItem.isFormField()) {
                /* 파일 이름을 가져옴, 경로 포함해서 가져옴 */
                String fileName = fileItem.getName();
                out.println("업로드된 파일 경로 및 이름 : " + fileName + "<br>");

                fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);  /* 경로의 최상위부터 \\까지 split으로 날려버림 */
                out.println("경로 제거 후 파일 이름 : " + fileName + "<br>");
                out.println("서버에 저장할 경로 및 이름" + fileUploadPath + "\\" + fileName + "<br>");

                File file = new File(fileUploadPath + "/" + fileName);  /* 로딩부터 이까지 메모리상에만 존재 */
                /* 실제로 저장장치에 쓰기 */
                fileItem.write(file);
            }
        }
    %>
</div>