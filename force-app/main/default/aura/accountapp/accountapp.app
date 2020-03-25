<aura:application extends ="force:slds">
     <lightning:layout class="slds-page-header slds-theme_offline">
        <lightning:layoutItem>
            <lightning:icon iconName="standard:search" alternativeText="SEARCH"/>
         </lightning:layoutItem><br/>
        
        <lightning:layoutItem>
                <h1 class="slds-text-heading_large slds-text-title_bold">Search account and related contact</h1>
              
        </lightning:layoutItem>
      
    </lightning:layout>
    <c:parentcmp/>
    <c:Accountcom2/>
    <c:NewAccount/>
</aura:application>