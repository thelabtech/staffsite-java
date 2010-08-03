<%@ include file="/modules/layout/header.jspf"%>
          <div id="enterStats">
            <h1>
              Enter Stats
            </h1>
            <h3>
              Enter your stats two ways:
            </h3>
            <div id="steps">
              <p>
                1
              </p>
              <p>
                2
              </p>
            </div><!-- end steps -->
            <div id="instruct">
              <h3 class="body-header">
                To Get Started
              </h3>
              <p>
                Search for your specific location, person, or team.
              </p>
              <p>
                Next, use the "Enter Stats" link under your specific strategy.
              </p>
              <p>
                Once you enter stats for a specific campus and strategy, it will automatically be bookmarked for the next time you enter stats.
              </p>
              <h3 class="body-header" style="margin-top: 68px;">
                Next Time You Enter Stats
              </h3>
              <p>
                Choose "Enter Stats" from the navigational bar on the top.
              </p>
              <p>
                You can now enter stats from any strategy or location you have bookmarked on that page.
              </p>
            </div><!-- end instruct -->
          </div><!-- end enterStats -->
          <div id="search">
            <h1>
              Search
            </h1>
            <h3>
              Search for a campus, person, or team.
            </h3>
            <h3 class="body-header">
              Type of Information:
            </h3>   
            <form action="<%=searchUrl%>" method="post" id="search_form">
              <input type="hidden" name="action" value="search"/>
              <div class="formText">
                <input style="margin-left: -2px;" type="radio" name="module" value="location" />&nbsp;&nbsp;Location<br />
                <input style="margin-left: -2px;" type="radio" name="module" value="person" />&nbsp;&nbsp;Person<br />
                <input style="margin-left: -2px;" type="radio" name="module" value="team" />&nbsp;&nbsp;Team<br />
                <br />
                <div class="select-divs">
                  Name:
                </div>
                <input name="name" type="text" class="input-margin" value="<%=search.get("name")!=null?search.get("name"):"" %>"/>
                <br />
                <div class="select-divs">
                  City:
                </div><input class="input-margin" type="text" name="city" /><br />
                <div class="select-divs">
                  State:
                </div>
                 <select name="state" class="input-margin">
							    <option value="" >Any</option>
							      <%String selectedState=(search.get("state")!=null&&quick)?(String)search.get("state"):"";
							      String[] stateCodesArray=States.abbrevState;
							      String[] stateNamesArray=States.expandedState;
							      int statesLength=stateCodesArray.length;
							      
							      for(int i=0;i<statesLength;i++){
							        String stateCode=stateCodesArray[i];
							        String stateName=stateNamesArray[i];
							        %>
							    <option value="<%=stateCode %>"  ><%=stateName %></option>
							  <%      }%>         
							  </select><br />
                <div class="select-divs">
                  Country:
                </div>
                 <select name="country" class="input-margin">
							    <option value="" >Any</option>
							      <%String selectedCountry=(search.get("country")!=null&&quick)?(String)search.get("country"):"";
							      String[] countrySearchArray=org.alt60m.util.CountryCodes.countryList;
							      int countriesLength=countrySearchArray.length;
							      int realLength=countriesLength/2;
							      for(int i=0;i<realLength;i++){
							        String countryCode=countrySearchArray[(i*2)+1];
							        String countryName=countrySearchArray[(i*2)];
							        %>
							    <option value="<%=countryCode %>"  ><%=countryName %></option>
							  <%      }%>         
							  </select><br />
              </div><!-- end formText -->
              <div id="strategy">
                <h3 class="body-header">
                  Strategy:
                </h3>
                <div class="formText">
                  <input type="hidden" name="strategy" value="nonnull"/>
                    <%
									  boolean selectStrategy=false;
									  for(String s:Strategy.strategiesArray()){ %>
									     <%if(!s.equals("EV")){ %>
									       <input type="checkbox" name="strategy" value="<%=s%>" />&nbsp;&nbsp;<%=Strategy.expandStrategy(s) %><br />
									     <%} 
									  }%>
                </div><!-- end formText -->
              </div><!-- end strategy -->
              <div id="region">
                <h3 class="body-header">
                  Region:
                </h3>
                <div class="formText">
                  <input type="hidden" name="region" value="nonnull" >
								  <%boolean selectRegion=false; %>
								  <%for(String r:Regions.abbrevRegion){ %>
                    <input type="checkbox" name="region" value="<%=r%>" />&nbsp;&nbsp;<%=Regions.expandRegion(r) %><br />
								  <%} %>
                </div><!-- end formText -->
              </div><!-- end region -->
              <a href="#" onclick="$('#search_form').submit();return false;">
                <img id="searchInfo" class="no-border" src="/modules/images/button_search.gif" alt="Search InfoBase" />
              </a>
            </form>
          </div><!-- end search -->
          <div id="viewReports">
            <h1>
              View Reports
            </h1>
            <h3 style="width: 265px;">
              Create reports of ministry activity.
            </h3>
            <h3 class="body-header">
              Success Criteria Reports
            </h3>
            <p>
              Generate a report for your missional team, geography, ministry, or for a specific conference or Summer Project.
            </p><a href="/servlet/Report?action=index&isMuster=false"><img class="no-border" src="/modules/images/button_create_SC_report.gif" alt="Create Success Criteria Report" /></a><br />
            <br />
            <h3 class="body-header">
              Ministry Tracker
            </h3>
            <p>
              Count the number of teams, movements, missional teams by geography, strategy, and other criteria.
            </p><a href="/servlet/Report?action=index&isMuster=true"><img class="no-border" src="/modules/images/button_create_MT_report.gif" alt="Create Ministry Tracker Report" /></a>
          </div><!-- end viewReports -->
<%@ include file="/modules/layout/footer.jspf"%>