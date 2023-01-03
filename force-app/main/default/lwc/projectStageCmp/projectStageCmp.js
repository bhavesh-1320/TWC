import { LightningElement,api } from 'lwc';
import allDetails from '@salesforce/apex/ProjectStageCtrl.getProjectDetails';

export default class ProjectStageCmp extends LightningElement {

    PPA='readonly';
    DDA='readonly';
    Construction='readonly';
    Warranty='readonly';
    answer;
    ppaId;
    ddaId;
    constructionId;
    warrantyId;

    @api recordId;

    ppaList=[]
    connectedCallback()
    {
        this.getData();
    }

    getData()
    {
        allDetails({recId: this.recordId}).then(res => 
            {
                 this.ppaList = res;
                 this.answer = this.ppaList[0].StageName;
                 this.ppaId=this.ppaList[0].PPAs__r != undefined ? this.ppaList[0].PPAs__r[0].Id : undefined;
                 this.ddaId=this.ppaList[0].DDAs__r != undefined ? this.ppaList[0].DDAs__r[0].Id : undefined;
                 this.constructionId=this.ppaList[0].Construction__r != undefined ? this.ppaList[0].Construction__r[0].Id : undefined;
                 this.warrantyId=this.ppaList[0].ContractId
                if(this.answer=='PPA'){
                   this.PPA = 'view';
                }

                else if(this.answer=='DDA'){
                    this.DDA='view';
                }
    
                else if(this.answer=='Construction'){
                    this.Construction = 'view';
                }
    
                else if(this.answer=='Warranty'){
                    this.Warranty= 'view';
        
                }

            }).catch(err =>
            {
                 console.log(err);
            })
    }
}