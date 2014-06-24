<%@ page import="edu.illinois.lis.Session" %>



<div class="fieldcontain ${hasErrors(bean: sessionInstance, field: 'endTime', 'error')} required">
	<label for="endTime">
		<g:message code="session.endTime.label" default="End Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endTime" precision="day"  value="${sessionInstance?.endTime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: sessionInstance, field: 'startTime', 'error')} required">
	<label for="startTime">
		<g:message code="session.startTime.label" default="Start Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startTime" precision="day"  value="${sessionInstance?.startTime}"  />
</div>

