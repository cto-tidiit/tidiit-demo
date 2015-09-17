<?php echo $html_heading; echo $header;?>
</div>
</header>
<article>
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-sm-12 productInner">
        <div class="page_content">
        <div class="row">
                <?php echo $userMenu;?>
                <div class="col-md-9 wht_bg">
                    <!-- Tab panes -->
                    <div class="tab_dashbord">
                    	<div class="active row">
                        	<div class="col-md-12 col-sm-12">
                                <div class="col-md-3 col-sm-3 dashboard red">
                                    <a href="<?php echo BASE_URL.'myaccount';?>" style="color: #FFF;"><span><i class="fa  fa-dashboard fa-5x"></i></span></a>
                            	</div>
                                
                                <div class="col-md-3 col-sm-3 dashboard blue">
                                    <a href="<?php echo BASE_URL.'myaccount';?>" style="color: #FFF;"><span><i class="fa fa-truck fa-5x"></i></span></a>
                            	</div>
                                
                                <div class="col-md-3 col-sm-3 dashboard green">
                                    <a href="<?php echo BASE_URL.'myaccount';?>" style="color: #FFF;"><span><i class="fa   fa-ship fa-5x"></i></span></a>
                            	</div>
                                
                                <div class="col-md-3 col-sm-3 dashboard yellow">
                                    <a href="<?php echo BASE_URL.'myaccount';?>" style="color: #FFF;"><span><i class="fa   fa-group fa-5x"></i></span></a>
                            	</div>
                                
                                <div class="col-md-3 col-sm-3 dashboard purple">
                                    <a href="<?php echo BASE_URL.'myaccount';?>" style="color: #FFF;"><span><i class="fa fa-server fa-5x"></i></span></a>
                            	</div>
                                
                                <div class="col-md-3 col-sm-3 dashboard maroon">
                                    <a href="<?php echo BASE_URL.'myaccount';?>" style="color: #FFF;"><span><i class="fa  fa-credit-card fa-5x"></i></span></a>
                            	</div> 
                            </div>                        
                            
                        </div>
                    </div>
                </div>
                
            </div>
        
        </div>
      </div>
    </div>
  </div>
</article>
<?php echo $footer;?>