package com.heal.controller;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.filechooser.FileSystemView;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.resource.HttpResource;
import org.apache.commons.lang3.RandomStringUtils;
//json parser
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.heal.dto.Friend;
//
import com.heal.dto.Member;
import com.heal.dto.Profile;
import com.heal.service.MatchingFriendService;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MatchingFriendController {
	
		/** service 연결 */
	 	@Autowired
	 	private MatchingFriendService friendService;

		/** 친구 찾기 페이지 첫 화면 */
		@RequestMapping("/friend/friendHome")
		public String friendHome(HttpSession session, Model model) {

			String id= (String)session.getAttribute("id");
			//내 프로필 불러오기
			Profile profile = friendService.getProfile(id);
			
			//내 친구 목록 불러오기 (최대 3개)
			ArrayList<Profile> friendProfile = friendService.getFriendProfile(id);
			
			model.addAttribute("profile",profile);			
			model.addAttribute("friendProfile",friendProfile);			
			
			return "/friend/friendHome";
		}
		
		/** 내 프로필 초기 설정 화면*/
		@RequestMapping("/friend/myProfile")
		public String myProfile() {
			
			return "/friend/myProfile";
		}
		
		
		/** 내 프로필 수정 화면*/
		@RequestMapping("/friend/editProfile")
		public String editProfile(HttpSession session, Model model) {
			
			String id= (String)session.getAttribute("id");

			Profile profile = friendService.getProfile(id);
			
			System.out.println(profile.getInterest());
			
			model.addAttribute("profile",profile);

			
			return "/friend/editProfile";
		}
		
		
		/** 내 프로필 저장*/
		@RequestMapping("/saveProfile")
		public String saveProfile(Profile profile, HttpServletResponse response_error, HttpServletRequest request, HttpSession session, Model model,
				@RequestPart(value="file") MultipartFile files) throws Exception{
			
			String id= (String)session.getAttribute("id");
			profile.setId(id);
			
			//연령대 불러오기
			String age = friendService.findAge(id);
			profile.setAge(age);
			
			//닉 불러오기
			String nick = friendService.findNick(id);
			profile.setNick(nick);
			
			/** 파일 업로드 */
			 String fileName  = files.getOriginalFilename(); 
		     String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
		     File destinationFile; 
		     String destinationFileName;
		     String fileUrl = request.getSession().getServletContext().getRealPath("profile/");
		     
		    	     do { 
		    	            destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
		    	            destinationFile = new File(fileUrl + destinationFileName); 
		    	        } while (destinationFile.exists()); 
		    	        
		    	        destinationFile.getParentFile().mkdirs(); 
		    	        files.transferTo(destinationFile); 
		    	          	        
		    	        //api 테스트	        
		    	        StringBuffer reqStr = new StringBuffer();
		    	        String clientId = "t6b3hcxzXWbixb_bNEZX";//애플리케이션 클라이언트 아이디값";
		    	        String clientSecret = "tmOhv7VXcc";//애플리케이션 클라이언트 시크릿값";
		    	        
		    	        try {
		    	            String paramName = "image"; // 파라미터명은 image로 지정
		    	            File uploadFile = new File(fileUrl + destinationFileName); 
		    	            String apiURL = "https://openapi.naver.com/v1/vision/face"; // 얼굴 감지
		    	            URL url = new URL(apiURL);
		    	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
		    	            con.setUseCaches(false);
		    	            con.setDoOutput(true);
		    	            con.setDoInput(true);
		    	            // multipart request
		    	            String boundary = "---" + System.currentTimeMillis() + "---";
		    	            con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
		    	            con.setRequestProperty("X-Naver-Client-Id", clientId);
		    	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		    	            OutputStream outputStream = con.getOutputStream();
		    	            PrintWriter writer = new PrintWriter(new OutputStreamWriter(outputStream, "UTF-8"), true);
		    	            String LINE_FEED = "\r\n";
		    	            // file 추가
		    	            String fileName2 = uploadFile.getName();
		    	            writer.append("--" + boundary).append(LINE_FEED);
		    	            writer.append("Content-Disposition: form-data; name=\"" + paramName + "\"; filename=\"" + fileName2 + "\"").append(LINE_FEED);
		    	            writer.append("Content-Type: "  + URLConnection.guessContentTypeFromName(fileName2)).append(LINE_FEED);
		    	            writer.append(LINE_FEED);
		    	            writer.flush();
		    	            FileInputStream inputStream = new FileInputStream(uploadFile);
		    	            byte[] buffer = new byte[4096];
		    	            int bytesRead = -1;
		    	            while ((bytesRead = inputStream.read(buffer)) != -1) {
		    	                outputStream.write(buffer, 0, bytesRead);
		    	            }
		    	            outputStream.flush();
		    	            inputStream.close();
		    	            writer.append(LINE_FEED).flush();
		    	            writer.append("--" + boundary + "--").append(LINE_FEED);
		    	            writer.close();
		    	            BufferedReader br = null;
		    	            int responseCode = con.getResponseCode();
		    	            if(responseCode==200) { // 정상 호출
		    	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		    	            } else {  // 에러 발생
		    	                System.out.println("error!!!!!!! responseCode= " + responseCode);
		    	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		    	            }
		    	            String inputLine;
		    	            if(br != null) {
		    	                StringBuffer response = new StringBuffer();
		    	                while ((inputLine = br.readLine()) != null) {
		    	                    response.append(inputLine);
		    	                }
		    	                br.close();
		    	                
		    	                    
		    	                String jsonText = response.toString();
		    	                
		    	                JSONParser jsonParser = new JSONParser();
		    	                JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonText);
		    	                JSONObject dataObject = (JSONObject) jsonObject.get("info");

		    	                int faceCount =  Integer.parseInt(String.valueOf(dataObject.get("faceCount")));
		    	                System.out.println("얼굴 인식 결과"+faceCount);
		    	                System.out.println(dataObject);
		    	                
		    	                //얼굴이 나와있는 정상 프로필 사진 전송
		    	                if(faceCount == 1) {
		    	                	
		    	                	 	profile.setFileName(destinationFileName);
		    			    	        profile.setFileOriName(fileName);
		    			    	        profile.setFileUrl(fileUrl);
		    			    	        
		    			    	        int result = friendService.insertProfile(profile);
		    			    	        
		    			    	        if(result==1) {
		    			    				return "/friend/friendHome";
		    			    			}else {
		    			    				model.addAttribute("title","프로필 추가 실패");
		    			    				model.addAttribute("message", "프로필 추가를 실패하였습니다. 관리자에게 문의하거나 다시 시도해주세요");
		    			    				return "error";
		    			    			}		    	                	
		    	                }else {
		    	                	//얼굴이 없는 사진 경우 
		    	                	response_error.setContentType("text/html;charset=utf-8");
		    	        			PrintWriter out = response_error.getWriter();
		    	        			out.println("<script>alert('[안내] 얼굴이 정확하게 나온 프로필 사진을 올려주세요.'); </script>");
		    	        			out.flush();

		    	        			return "/friend/myProfile";
		    	                }
		    	            } else {
		    	                System.out.println("error !!!");
		    	            }
		    	        } catch (Exception e) {
		    	            System.out.println(e);
		    	        }    
		    	        
		    	        return "/friend/friendHome";
			
		    }
		
		/**내 프로필 수정*/
//		@RequestMapping("/editProfile")
//		public String editProfile(Profile profile,  HttpServletRequest request, HttpSession session, Model model,
//				@RequestPart(value="file") MultipartFile files) throws Exception{
//			
//			String id= (String)session.getAttribute("id");
//			profile.setId(id);
//			
//			//연령대 불러오기
//			String age = friendService.findAge(id);
//			profile.setAge(age);
//			
//			//닉 불러오기
//			String nick = friendService.findNick(id);
//			profile.setNick(nick);
//			
//			/** 파일 업로드 */
//			 String fileName  = files.getOriginalFilename(); 
//		     String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
//		     File destinationFile; 
//		     String destinationFileName;
//		     String fileUrl = request.getSession().getServletContext().getRealPath("profile/");
//		     
//		    	     do { 
//		    	            destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
//		    	            destinationFile = new File(fileUrl + destinationFileName); 
//		    	        } while (destinationFile.exists()); 
//		    	        
//		    	        destinationFile.getParentFile().mkdirs(); 
//		    	        files.transferTo(destinationFile); 
//		    	        
//		    	        profile.setFileName(destinationFileName);
//		    	        profile.setFileOriName(fileName);
//		    	        profile.setFileUrl(fileUrl);
//		    	        
//		    	        int result = friendService.updateProfile(profile);
//		    	        
//		    	        if(result==1) {
//		    				return "redirect:/friend/friendHome";
//		    			}else {
//		    				model.addAttribute("title","프로필 수정 실패");
//		    				model.addAttribute("message", "프로필 수정을 실패하였습니다. 관리자에게 문의하거나 다시 시도해주세요");
//		    				return "error";
//		    			}
//		    }
//		
		/** 내 프로필 삭제 */
		@RequestMapping("/deleteProfile")
		public String profileDelete(String id,  Model model) {
			
			System.out.println("여기는 컨트롤러"+id);
			
			id = id.trim();
			
			int result = friendService.deleteForm(id);
			System.out.println(result);
						
			if(result==1) {
				return "redirect:/friend/friendHome";
			}else {
				model.addAttribute("title","[오류] 프로필 삭제 실패");
				model.addAttribute("message", "프로필 삭제를 실패하였습니다. 관리자에게 문의하거나 다시 시도해주세요");
				return "/user/error";
			}	
		}
		
		/** 친구 리스트 보기 */
		@RequestMapping("/friend/friendList")
		public String friendList(HttpSession session, Model model) {
			
			String id= (String)session.getAttribute("id");
			
			ArrayList<Profile> profile = friendService.getFriendList(id);
			model.addAttribute("profile",profile);
			
			return "/friend/friendList";
		}
		
		/** 친구 찾기 메인 
		 * @throws IOException */
		@RequestMapping("/friend/findFriend")
		public String findFriend(HttpSession session, HttpServletResponse response, Model model) throws IOException {
			
			String id= (String)session.getAttribute("id");
			
			//회원들 전체 프로필 불러오기 - 현재 사용자 제외
			ArrayList<Profile> profile = friendService.getAllProfile(id);
			
			//현재 친구 관계인 사람도 제외
			ArrayList<Friend> friend = friendService.getMyFriend(id);
			
			System.out.println("arraylist 버전의 "+friend);
		//	System.out.println("String 버전의 "+myFriend);
			
			//친구 추천 매칭
			//(1) 같은 연령대인 사람을 추천해줄까?
			Member me = friendService.selectMe(id);
			String age = me.getAge();
			ArrayList<Profile> sameAge = friendService.getSameAgeFriend(id, age);
			
			//(2) 같은 취미를 가지고 있는 사람 추천
			String interest = friendService.getMyInterest(id);
			
			if(interest == null) {
				response.setContentType("text/html;charset=utf-8");
    			PrintWriter out = response.getWriter();
    			out.println("<script>alert('[안내] 프로필을 입력한 회원만 친구 찾기가 가능합니다.'); </script>");
    			out.flush();

    			return "/friend/friendHome";
				
			}
			String[] splited = interest.split(",");
			
			String separator = "|"; 
		    StringBuilder sb = new StringBuilder(); 
		    
		    int listSize = splited.length; 
		    for (int i = 0; i < listSize; i++){ 
		        sb.append(splited[i]); 
		        
		        if (i < listSize - 1){ 
		            sb.append(separator); 
		        } 
		    } 
		    
		    interest = sb.toString();
		    
		    ArrayList<Profile> sameInterest = friendService.getSameInterest(id, interest);
			
		    //중복 제거
		    boolean result = Arrays.equals(sameAge.toArray(), sameInterest.toArray());
		    sameAge.removeAll(sameInterest);
		    sameInterest.removeAll(sameAge);
		
		    
		    System.out.println("sameAge"+sameAge);
		    System.out.println("sameInterest"+sameInterest);
		    
			model.addAttribute("id",id);
			model.addAttribute("sameAge", sameAge);
			model.addAttribute("sameInterest", sameInterest);
			model.addAttribute("profile", profile);

			return "/friend/findFriend";
		}
		
		/** 친구 추가하기 */
		@RequestMapping("/friend/addFriend")
		public String addFriend(HttpSession session, String friend, Model model) {
			
			String id= (String)session.getAttribute("id");
			
			int result = friendService.addFriend(id, friend);
			int result2 = friendService.addFriendToo(id, friend);
			
			if(result==1&&result2==1) {
				  return "redirect:/friend/friendHome";
			}else {
				model.addAttribute("title","[오류] 친구 추가 실패");
				model.addAttribute("message", "친구 추가를 실패하였습니다. 관리자에게 문의하거나 다시 시도해주세요");
				return "error";
			}	
	}
		
		/** 친구 프로필 자세히 보기 */
		@RequestMapping("/friend/friendDetail")
		public String friendDetail(String id, Model model) {
			
			Profile profile = friendService.getFriendDetail(id);
			
			model.addAttribute("profile", profile);
			
			return "/friend/friendDetail";
		}
		
		/** 친구 삭제하기 */
		@RequestMapping("/friend/friendDelete")
		public String friendDelete(String id, Model model) {
			
			int result = friendService.deleteFriend(id);
			
			if(result==1) {
				return "redirect:/friend/friendHome";
			}else {
				model.addAttribute("title","[오류] 친구 삭제 실패");
				model.addAttribute("message", "친구 삭제를 실패하였습니다. 관리자에게 문의하거나 다시 시도해주세요");
				return "error";
			}	
		}
		
		/** 에러 페이지 */
		@RequestMapping("/user/error")
		public String error() {
			
			return "/user/error";
		}
		
		
		/** API TEST */

		/**내 프로필 수정*/
				@RequestMapping("/editProfile")
				public String editProfile2(Profile profile,  HttpServletResponse response_error, HttpServletRequest request, HttpSession session, Model model,
						@RequestPart(value="file") MultipartFile files) throws Exception{
					
					String id= (String)session.getAttribute("id");
					profile.setId(id);
					
					//연령대 불러오기
					String age = friendService.findAge(id);
					profile.setAge(age);
					
					//닉 불러오기
					String nick = friendService.findNick(id);
					profile.setNick(nick);
					
					/** 파일 업로드 */
					 String fileName  = files.getOriginalFilename(); 
				     String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
				     File destinationFile; 
				     String destinationFileName;
				     String fileUrl = request.getSession().getServletContext().getRealPath("profile/");
				     
				    	     do { 
				    	            destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
				    	            destinationFile = new File(fileUrl + destinationFileName); 
				    	        } while (destinationFile.exists()); 
				    	        
				    	        destinationFile.getParentFile().mkdirs(); 
				    	        files.transferTo(destinationFile); 
				    	          	        
				    	        //api 테스트	        
				    	        StringBuffer reqStr = new StringBuffer();
				    	        String clientId = "t6b3hcxzXWbixb_bNEZX";//애플리케이션 클라이언트 아이디값";
				    	        String clientSecret = "tmOhv7VXcc";//애플리케이션 클라이언트 시크릿값";
				    	        
				    	        try {
				    	            String paramName = "image"; // 파라미터명은 image로 지정
				    	            File uploadFile = new File(fileUrl + destinationFileName); 
				    	            String apiURL = "https://openapi.naver.com/v1/vision/face"; // 얼굴 감지
				    	            URL url = new URL(apiURL);
				    	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
				    	            con.setUseCaches(false);
				    	            con.setDoOutput(true);
				    	            con.setDoInput(true);
				    	            // multipart request
				    	            String boundary = "---" + System.currentTimeMillis() + "---";
				    	            con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
				    	            con.setRequestProperty("X-Naver-Client-Id", clientId);
				    	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
				    	            OutputStream outputStream = con.getOutputStream();
				    	            PrintWriter writer = new PrintWriter(new OutputStreamWriter(outputStream, "UTF-8"), true);
				    	            String LINE_FEED = "\r\n";
				    	            // file 추가
				    	            String fileName2 = uploadFile.getName();
				    	            writer.append("--" + boundary).append(LINE_FEED);
				    	            writer.append("Content-Disposition: form-data; name=\"" + paramName + "\"; filename=\"" + fileName2 + "\"").append(LINE_FEED);
				    	            writer.append("Content-Type: "  + URLConnection.guessContentTypeFromName(fileName2)).append(LINE_FEED);
				    	            writer.append(LINE_FEED);
				    	            writer.flush();
				    	            FileInputStream inputStream = new FileInputStream(uploadFile);
				    	            byte[] buffer = new byte[4096];
				    	            int bytesRead = -1;
				    	            while ((bytesRead = inputStream.read(buffer)) != -1) {
				    	                outputStream.write(buffer, 0, bytesRead);
				    	            }
				    	            outputStream.flush();
				    	            inputStream.close();
				    	            writer.append(LINE_FEED).flush();
				    	            writer.append("--" + boundary + "--").append(LINE_FEED);
				    	            writer.close();
				    	            BufferedReader br = null;
				    	            int responseCode = con.getResponseCode();
				    	            if(responseCode==200) { // 정상 호출
				    	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				    	            } else {  // 에러 발생
				    	                System.out.println("error!!!!!!! responseCode= " + responseCode);
				    	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				    	            }
				    	            String inputLine;
				    	            if(br != null) {
				    	                StringBuffer response = new StringBuffer();
				    	                while ((inputLine = br.readLine()) != null) {
				    	                    response.append(inputLine);
				    	                }
				    	                br.close();
				    	                
				    	                    
				    	                String jsonText = response.toString();
				    	                
				    	                JSONParser jsonParser = new JSONParser();
				    	                JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonText);
				    	                JSONObject dataObject = (JSONObject) jsonObject.get("info");

				    	                int faceCount =  Integer.parseInt(String.valueOf(dataObject.get("faceCount")));
				    	                System.out.println("얼굴 인식 결과"+faceCount);
				    	                System.out.println(dataObject);
				    	                
				    	                //얼굴이 나와있는 정상 프로필 사진 전송
				    	                if(faceCount == 1) {
				    	                	
				    	                	 	profile.setFileName(destinationFileName);
				    			    	        profile.setFileOriName(fileName);
				    			    	        profile.setFileUrl(fileUrl);
				    			    	        
				    			    	        int result = friendService.updateProfile(profile);
				    			    	        
				    			    	        if(result==1) {
				    			    				return "/friend/friendHome";
				    			    			}else {
				    			    				model.addAttribute("title","프로필 수정 실패");
				    			    				model.addAttribute("message", "프로필 수정을 실패하였습니다. 관리자에게 문의하거나 다시 시도해주세요");
				    			    				return "error";
				    			    			}		    	                	
				    	                }else {
				    	                	//얼굴이 없는 사진 경우 
				    	                	response_error.setContentType("text/html;charset=utf-8");
				    	        			PrintWriter out = response_error.getWriter();
				    	        			out.println("<script>alert('[안내] 얼굴이 정확하게 나온 프로필 사진을 올려주세요.'); </script>");
				    	        			out.flush();

				    	        			return "/friend/editProfile";
				    	                }
				    	            } else {
				    	                System.out.println("error !!!");
				    	            }
				    	        } catch (Exception e) {
				    	            System.out.println(e);
				    	        }    
				    	        
				    	        return "/friend/friendHome";
				    } //함수 끝
		
	
}
