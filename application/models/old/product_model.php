<?php
class Product_model extends CI_Model {
	private $_table='product';
	private $_table_image='product_image';
	private $_table_price='product_price';
	private $_table_country='product_country';
	private $_tag='tags';
	private $_table_tag='product_tag';
	private $_table_discount='product_discount';
	private $_SiteSession="";
	private $_tmp_cart="temp_cart";
	private $_tmp_shipping="user_temp_cart_shipping";
        private $_table_deal="product_deal";
                
	function __construct() {
		$this->_SiteSession=$this->session->userdata('USER_SITE_SESSION_ID');
	}
	
	public function get_all_admin($PerPage=0,$PageNo=0){
            //echo '<pre>'.print_r($_POST);die;
            $Title              =  $this->input->get_post('SearchFilterTitle',TRUE);
            $productModel       =  $this->input->get_post('SearchFilterCode',TRUE);
            $Status             =  $this->input->get_post('SearchFilterStatus',TRUE);
            $Featured           =  $this->input->get_post('SearchFilterFeatured',TRUE);
            $Deals           =  $this->input->get_post('SearchFilterDeal',TRUE);
            $Popular           =  $this->input->get_post('SearchFilterPopular',TRUE);
            $CategoryID         =  $this->input->get_post('SearchFilterTopCategory',TRUE);
            $Region             =  $this->input->get_post('SearchFilterRegion',TRUE);
            $isNew             =  $this->input->get_post('SearchFilterIsNew',TRUE);
            
            //echo '$Title'.$Title.'$Status '.$Status.'$Featured'.$Featured.'$CategoryID'.$CategoryID.'$Region'.$Region.' $Deals '.$Deals.' $isNew '.$isNew;die;
                    
            
            //echo 'PerPage '.$PerPage.'   $PageNo  '.$PageNo;die;
		//$sql="SELECT p.*,pi.Image,co.CountryName,c.CategoryName FROM `product` as p JOIN `product_image` as pi ON(p.ProductID=pi.ProductID) JOIN `product_country` AS pc ON(p.ProductID=pc.ProductID) JOIN `category` AS c ON(p.CategoryID=c.CategoryID) LEFT JOIN `country` AS co ON(pc.CountryID=co.CountryID)  WHERE p.Status < 2 AND c.Status='1' ORDER BY p.ProductID DESC";
                $this->db->select('p.*,pi.Image,co.CountryName,c.CategoryName,c.isAddToCart')->from('product p');
                $this->db->join('product_image pi','p.ProductID=pi.ProductID');
                $this->db->join('product_country pc','p.ProductID=pc.ProductID');
                $this->db->join('category c','p.CategoryID=c.CategoryID');
                $this->db->join('country co','pc.CountryID=co.CountryID');
                $this->db->where('c.Status','1');
                
                if($Status==""){
                    $this->db->where('p.Status <','2');
                }else{
                    $this->db->where('p.Status',$Status);
                }
                
                if($Featured!=""){
                    $this->db->where('p.Featured',$Featured);
                }
                
                if($CategoryID!=""){
                    $this->db->where('p.CategoryID',$CategoryID);
                }
                
                if($Region!=""){
                    $this->db->where('pc.CountryID',$Region);
                }
                
                if($Title!=""){
                    $this->db->like('p.Title',$this->db->escape_like_str($Title));
                }
                
                if($isNew!=""){
                    $this->db->like('p.isNew',$isNew);
                }
                
                if($Deals!=""){
                    $this->db->like('p.Deals',$Deals);
                }
                
                if($Popular!=""){
                    $this->db->like('p.Popular',$Popular);
                }
                
                if($productModel!=""){
                    $this->db->like('p.Model',$productModel);
                }
                
                $this->db->order_by('p.ProductID','DESC');
                $this->db->order_by('p.DealPriceUpdateTime','DESC');
                
                if($PerPage>0){
                    $this->db->limit($PerPage,$PageNo);
                }    
                $dataArr= $this->db->get()->result();
                //echo '<br />'.$this->db->last_query(); die;
                return $dataArr;
	}
	
        
        public function get_admin_total(){
                $Title              =  $this->input->get_post('SearchFilterTitle',TRUE);
                $productModel       =  $this->input->get_post('SearchFilterCode',TRUE);
                $Status             =  $this->input->get_post('SearchFilterStatus',TRUE);
                $Featured           =  $this->input->get_post('SearchFilterFeatured',TRUE);
                $Deals              =  $this->input->get_post('SearchFilterDeal',TRUE);
                $Popular              =  $this->input->get_post('SearchFilterPopular',TRUE);
                $CategoryID         =  $this->input->get_post('SearchFilterTopCategory',TRUE);
                $Region             =  $this->input->get_post('SearchFilterRegion',TRUE);
                $IsNew             =  $this->input->get_post('SearchFilterIsNew',TRUE);

                $this->db->select('p.*,pi.Image,co.CountryName,c.CategoryName,c.isAddToCart')->from('product p');
                $this->db->join('product_image pi','p.ProductID=pi.ProductID');
                $this->db->join('product_country pc','p.ProductID=pc.ProductID');
                $this->db->join('category c','p.CategoryID=c.CategoryID');
                $this->db->join('country co','pc.CountryID=co.CountryID');
                $this->db->where('c.Status','1');
                
                if($Status==""){
                    $this->db->where('p.Status <','2');
                }else{
                    $this->db->where('p.Status',$Status);
                }
                
                if($Featured!=""){
                    $this->db->where('p.Featured',$Featured);
                }
                
                if($CategoryID!=""){
                    $this->db->where('p.CategoryID',$CategoryID);
                }
                
                if($Region!=""){
                    $this->db->where('pc.CountryID',$Region);
                }
                
                if($IsNew!=""){
                    $this->db->where('p.isNew',$IsNew);
                }
                
                if($Deals!=""){
                    $this->db->where('p.Deals',$Deals);
                }
                
                if($Popular!=""){
                    $this->db->where('p.Popular',$Popular);
                }
                
                if($Title!=""){
                    $this->db->like('p.Title',$this->db->escape_like_str($Title));
                }
                
                if($productModel!=""){
                    $this->db->like('p.Model',$productModel);
                }
                
                $this->db->order_by('p.ProductID','DESC');
                $this->db->order_by('p.DealPriceUpdateTime','DESC');
		$rs=$this->db->get()->result();
                //echo $this->db->last_query();die;
                return count($rs);

        }
	public function get_all_product(){
		$this->db->select('*')->from($this->_table)->where('Status','1');
		return $this->db->get()->result();
	}
	
	public function add($dataArr){
		$this->db->insert($this->_table,$dataArr);
		return $this->db->insert_id();
	}
	
	public function edit($DataArr,$ProductID){
		$this->db->where('ProductID',$ProductID);
		$this->db->update($this->_table,$DataArr);
		//echo $this->db->last_query();die;
		return TRUE;		
	}
	
	public function change_status($ProductID,$action){
		if($action=='active'){
			$Status=1;
		}else{
			$Status=0;
		}
		$this->db->where_in('ProductID',explode(',',$ProductID));
		$this->db->update($this->_table,array('Status'=>$Status));
		//echo $this->db->last_query();die;
		return TRUE;
	}
	
	public function remove_featured($ProductID){
		$this->db->where_in('ProductID',explode(',',$ProductID));
		$this->db->update($this->_table,array('Featured'=>0));
		return TRUE;
	}
        
        public function featured($ProductID){
		$this->db->where_in('ProductID',explode(',',$ProductID));
		$this->db->update($this->_table,array('Featured'=>1));
		return TRUE;
	}

	public function make_new($ProductID){
		$this->db->where_in('ProductID',explode(',',$ProductID));
		$this->db->update($this->_table,array('isNew'=>1));
		return TRUE;
	}
        
        public function make_old($ProductID){
		$this->db->where_in('ProductID',explode(',',$ProductID));
		$this->db->update($this->_table,array('isNew'=>0));
		return TRUE;
	}
	
        public function deals($ProductID){
		$this->db->where_in('ProductID',explode(',',$ProductID));
		$this->db->update($this->_table,array('Deals'=>1));
		return TRUE;
	}
        
        public function remove_deals($ProductID){
		$this->db->where_in('ProductID',explode(',',$ProductID));
		$this->db->update($this->_table,array('Deals'=>0));
		return TRUE;
	}
        
	public function popular($ProductID){
		$this->db->where_in('ProductID',explode(',',$ProductID));
		$this->db->update($this->_table,array('Popular'=>1));
		return TRUE;
	}
	
        public function remove_popular($ProductID){
		$this->db->where_in('ProductID',explode(',',$ProductID));
		$this->db->update($this->_table,array('Popular'=>0));
		return TRUE;
	}
	
	public function delete($ProductID){
		// delete from product table
		$this->db->where_in('ProductID',explode(',',$ProductID));
		$this->db->delete($this->_table); 
		
		// delete prodcut image
		$this->delete_product_image($ProductID);
		
		// delete prodcut  price
		$this->delete_product_price($ProductID);
		
		// delete prodcut  price
		$this->delete_product_tag($ProductID);
		return TRUE;
	}
	
	public function add_image($dataArr){
		$this->db->insert($this->_table_image,$dataArr);
		return $this->db->insert_id();
	}
	
	public function edit_product_image($dataArr,$ProductID){
		$this->db->where('ProductID',$ProductID);
		$this->db->update($this->_table_image,$dataArr);
		//echo $this->db->last_query();die;
		return TRUE;
	}
	
	public function get_products_images($ProductID){
		$this->db->select('*')->from($this->_table_image)->where_in('ProductID',explode(',',$ProductID));
		return $this->db->get()->result();
	}
	
	public function delete_product_image($ProductID){
		$this->db->where_in('ProductID',explode(',',$ProductID));
		$this->db->delete($this->_table_image); 
	}
	
	public function add_price($dataArr){
		$this->db->insert($this->_table_price,$dataArr);
		return $this->db->insert_id();
	}
	
	public function add_country($dataArr){
		$this->db->insert($this->_table_country,$dataArr);
		return $this->db->insert_id();	
		
		/*if($dataArr["CountryID"]=='240'){
			$CountryDataArr=$this->db->select('CountryID')->from($this->_country)->get()->result();
			$BatchDataArr=array();
			foreach($CountryDataArr AS $k){
				$TmpArr=array();
				$TmpArr=array('ProductID'=>$dataArr['ProductID'],'CountryID'=>$k->CountryID);
				$BatchDataArr[]=$TmpArr;
			}
			$this->db->insert_batch($this->_table_country, $BatchDataArr); 
			return TRUE;
		}else{
			
		}*/
		
	}
	public function edit_price($dataArr,$ProductID){
		$this->db->where('ProductID',$ProductID);
		$this->db->update($this->_table_price,$dataArr);
		//echo $this->db->last_query();die;
		return TRUE;
	}
	
	public function delete_product_price($ProductID){
		$this->db->where_in('ProductID',explode(',',$ProductID));
		$this->db->delete($this->_table_price); 
	}
	
	public function add_product_tag($dataArr){
		$ProductID=$dataArr["ProductID"];
		$TagArr=explode(',',$dataArr["TagStr"]);
		foreach($TagArr AS $k){
			$TagID=0;
			$ProductTagArr=array();
			$TagDataArr=array();
			$TagDataArr=$this->get_tag_id_by_tag($k);
			if(count($TagDataArr)>0){
				$ProductTagArr=array('ProductID'=>$ProductID,'TagID'=>$TagDataArr[0]->TagID);
				$this->add_tag_product($ProductTagArr);
			}else{
				if($k!=""){
					$TagID=$this->add_tag($k);
					if($TagID>0){
						$ProductTagArr=array('ProductID'=>$ProductID,'TagID'=>$TagID);
						$this->add_tag_product($ProductTagArr);	
					}
				}
			}
		}
		return true;
	}
        
        public function add_category_tag($dataArr){
            $CategoryID=$dataArr["CategoryID"];
            $TagArr=explode(',',$dataArr["TagStr"]);
            $CategoryTagArr=array();
            foreach($TagArr AS $k){
                $TagDataArr=array();
                $TagDataArr=$this->get_tag_id_by_tag($k);
                if(count($TagDataArr)>0){
                    $rs=$this->db->query("SELECT * FROM category_tag WHERE CategoryID='".$CategoryID."' AND TagID='".$TagDataArr[0]->TagID."'")->result();
                    if(empty($rs))
                        $CategoryTagArr[]=array('CategoryID'=>$CategoryID,'TagID'=>$TagDataArr[0]->TagID);
                }else{
                    if($k!=""){
                        echo '<br>not exis add new <br>';
                        $TagID=$this->add_tag($k);
                        if($TagID>0){
                                $CategoryTagArr[]=array('CategoryID'=>$CategoryID,'TagID'=>$TagID);
                        }
                    }
                }
            }
            pre($CategoryTagArr);
            return true;
	}
	public function edit_product_tag($dataArr){
		$ProductID=$dataArr["ProductID"];
		$TagArr=explode(',',$dataArr["TagStr"]);
                //echo '<pre>';print_r($TagArr);die;
		foreach($TagArr AS $k){
			$TagID=0;
			$ProductTagArr=array();
			$TagDataArr=array();
                        //echo $k;die;
			$TagDataArr=$this->get_tag_id_by_tag($k);
                        //echo '<pre>';print_r($TagDataArr);die;
			if(count($TagDataArr)>0){
				if($this->is_product_tag_exists($ProductID,$TagDataArr[0]->TagID)==FALSE){
					$ProductTagArr=array('ProductID'=>$ProductID,'TagID'=>$TagDataArr[0]->TagID);
					$this->add_tag_product($ProductTagArr);
				}
			}else{
				if($k!=""){
					$TagID=$this->add_tag($k);
					if($TagID>0){
						$ProductTagArr=array('ProductID'=>$ProductID,'TagID'=>$TagID);
						$this->add_tag_product($ProductTagArr);	
					}
				}
			}
		}
		return true;
	}
	
	public function is_product_tag_exists($ProductID,$TagID){
		$sql="SELECT * FROM product_tag WHERE `ProductID`='".$ProductID."' AND `TagID`='".$TagID."'";
		$dataArr=$this->db->query($sql)->result();
		if(count($dataArr)>0){
			return TRUE;
		}else{
			return FALSE;
		}
	}	
	public function add_tag($tag){
		$dataArr=array('name'=>$this->db->escape_str($tag));
		$this->db->insert($this->_tag,$dataArr);
		return $this->db->insert_id();
	}
	
	public function get_tag_id_by_tag($tag){
		$this->db->select('*')->from($this->_tag)->where('name',$this->db->escape_str($tag));
		$rs=$this->db->get()->result();
                //echo $this->db->last_query();die;
                return $rs;
	}
	
	public function add_tag_product($DataArr){
		$this->db->insert($this->_table_tag,$DataArr);
		return $this->db->insert_id();
	}
	
	public function delete_product_tag($ProductID){
		$this->db->where_in('ProductID',explode(',',$ProductID));
		$this->db->delete($this->_table_tag); 		
	}
	
	public function details($id){
		$sql="SELECT p.*,c.CountryName,c.CountryID,pi.Image,dis.Amount,pd.DiscountID,ca.isAddToCart "
                        . " FROM `product` AS p JOIN `product_country` AS pc ON(p.ProductID=pc.ProductID) "
                        . " JOIN product_image as pi ON(p.productID=pi.ProductID) "
                        . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                        . " LEFT JOIN `country` AS c ON(pc.CountryID=c.CountryID) "
                        . " LEFT JOIN `category` AS ca ON(ca.CategoryID=p.CategoryID) "
                        . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) WHERE p.ProductID='".$id."' ";
		//die($sql);
		return $this->db->query($sql)->result();
	}
	
	public function get_tag_by_product_id($ProductID){
		$sql="SELECT t.name FROM tags as t JOIN product_tag as pt ON(pt.TagID=t.TagID) WHERE pt.ProductID='".$ProductID."'";
		return $this->db->query($sql)->result();
		
	}
	
	public function get_all_tag_for_landing(){
		return $this->db->select('*')->from($this->_tag)->where('Landing',1)->limit(12)->order_by("TagID", "desc")->get()->result();
	}
	
	public function get_all_tag_for_footer(){
            $CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
            $sql="SELECT DISTINCT t.TagID,t.name FROM `tags` AS t "
                    . " JOIN `product_tag` AS pt ON(t.TagID=pt.TagID) "
                    . " JOIN `product_country` AS pc ON(pt.ProductID=pc.ProductID) "
                    . " WHERE pc.CountryID='".$CountryID."' AND t.Home=1 ORDER BY t.TagID DESC LIMIT 0,10";
		return $this->db->query($sql)->result();
	}
	
	public function get_home_popular(){
		$CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
		$sql="SELECT p.*,pi.Image,c.CategoryName,dis.Amount,c.isAddToCart "
                        . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                        . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                        . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                        . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID)  "
                        . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                        . " WHERE p.Popular='1' AND c.Status=1 AND p.Status='1' AND pc.CountryID='".$CountryID."' ORDER BY RAND() DESC LIMIT 0,5";
		return $this->db->query($sql)->result();
	}
        
        public function get_category_popular($CategoryID){
		$CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
		$sql="SELECT p.*,pi.Image,c.CategoryName,dis.Amount,c.isAddToCart "
                        . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                        . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                        . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                        . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID)  "
                        . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                        . " WHERE p.Popular='1' AND c.Status=1 AND p.Status='1' AND pc.CountryID='".$CountryID."' AND c.CategoryID=".$CategoryID." ORDER BY RAND() DESC LIMIT 0,5";
		return $this->db->query($sql)->result();
	}
	
	
	public function get_home_featured(){
		$CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
		$sql="SELECT p.*,pi.Image,c.CategoryName,dis.Amount,c.isAddToCart FROM product AS p "
                        . " JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                        . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                        . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                        . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                        . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                        . " WHERE p.Featured='1' AND c.Status=1 AND p.Status='1' AND pc.CountryID='".$CountryID."' ORDER BY p.ProductID DESC LIMIT 0,6";
		return $this->db->query($sql)->result();
	}
	
	public function get_recent_6_product(){
		$CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
		$sql="SELECT p.*,pi.Image,c.CategoryName,dis.Amount,c.isAddToCart "
                        . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                        . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                        . " JOIN category AS c ON(p.CategoryID=c.CategoryID)  "
                        . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                        . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                        . " WHERE p.Status=1 AND c.Status=1 AND pc.CountryID='".$CountryID."' AND p.isNew='1' ORDER BY p.ProductID DESC,p.DealPriceUpdateTime DESC LIMIT 0,6";
		return $this->db->query($sql)->result();
	}
        
	public function get_recent_4_product(){
		$CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
		$sql="SELECT p.*,pi.Image,c.CategoryName,c.isAddToCart,dis.Amount "
                        . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                        . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                        . " JOIN category AS c ON(p.CategoryID=c.CategoryID)  "
                        . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                        . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                        . " WHERE p.Status=1 AND c.Status=1 AND pc.CountryID='".$CountryID."' AND p.isNew='1' ORDER BY p.ProductID DESC,p.DealPriceUpdateTime DESC LIMIT 0,4";
		return $this->db->query($sql)->result();
	}
        
	public function get_product_by_category($CategoryID,$per_page=0,$offcet=0,$ProductID=0,$level=3){
            $CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
            $MinPrice=$this->input->post('min_price',TRUE);
            $MaxPrice=$this->input->post('max_price',TRUE);
            $PriceSortType=$this->input->post('price_sort_type',TRUE);
            $SearchProductTitle=$this->input->post('SearchProductTitle',TRUE);
            $CateLevel='CategoryID'.$level;
            $sql="SELECT p.*,pi.Image,c.CategoryName,c.isAddToCart,c.Note,dis.Amount "
                    . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID)"
                    . "  JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                    . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                    . " JOIN category AS c1 ON(p.`CategoryID`=c1.CategoryID) "
                    . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                    . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID)"
                    . "  WHERE p.Status=1 AND c.Status=1  AND c1.Status='1' AND p.`".$CateLevel."`='".$CategoryID."' AND pc.CountryID='".$CountryID."'  ";
            if($SearchProductTitle!="")
                $sql .= " AND p.Title LIKE '%".$SearchProductTitle."%'";
            if($ProductID>0){
                $sql .=" AND p.ProductID !=".$ProductID;
            }

            if($MinPrice!="" && $MaxPrice!=""){
                $sql .= " AND p.Price BETWEEN $MinPrice AND $MaxPrice ";
            }


            if($PriceSortType=="")
                $sql .=" ORDER BY p.ProductID DESC,p.DealPriceUpdateTime DESC ";
            else
                $sql .=" ORDER BY p.price $PriceSortType";

            
            $sql.=" LIMIT $offcet,$per_page";
            //echo $sql;die;
            return $this->db->query($sql)->result();
	}
        
        
        
        public function get_total_product_by_category($CategoryID,$ProductID=0){
            $ci =& get_instance();
            $ci->load->model('Category_model');
            $rsCat=$ci->Category_model->get_parrent_data_by_id($CategoryID);
            $CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
            if($rsCat[0]->ParrentCategoryID==0){
                $sql="SELECT p.*,pi.Image,c.CategoryName,dis.Amount,c.isAddToCart "
                        . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                        . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                        . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                        . " JOIN category AS c1 ON( c.ParrentCategoryID=c1.`CategoryID` AND c.Status=1 ) "
                        . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                        . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                        . " WHERE p.Status=1 AND c1.Status=1 AND c1.`CategoryID`='".$CategoryID."' AND pc.CountryID='".$CountryID."' ";
                if($ProductID>0){
                    $sql .=" AND p.ProductID !=".$ProductID;
                }
                
                $sql .=" ORDER BY p.ProductID DESC,p.DealPriceUpdateTime DESC ";
                $num=$this->db->query($sql)->num_rows();
                
		$sql1="SELECT p.*,pi.Image,c.CategoryName,dis.Amount,c.isAddToCart "
                        . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                        . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                        . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                        . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                        . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                        . " WHERE p.Status=1 AND c.Status=1 AND p.CategoryID='".$CategoryID."' AND pc.CountryID='".$CountryID."' ";
                if($ProductID>0){
                    $sql1 .=" AND p.ProductID !=".$ProductID;
                }
                
                $sql1 .=" ORDER BY p.ProductID DESC,p.DealPriceUpdateTime DESC ";
                $num1=$this->db->query($sql1)->num_rows();
                return $num+$num1;
            }else{
                $sql="SELECT p.*,pi.Image,c.CategoryName,dis.Amount,c.isAddToCart "
                        . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                        . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                        . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                        . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                        . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                        . " WHERE p.Status=1 AND c.Status=1 AND p.CategoryID='".$CategoryID."' AND pc.CountryID='".$CountryID."' ";
                if($ProductID>0){
                    $sql .=" AND p.ProductID !=".$ProductID;
                }
                
                $sql .=" ORDER BY p.ProductID DESC,p.DealPriceUpdateTime DESC ";
                $num=$this->db->query($sql)->num_rows();
                return $num;
            }
	}
        
	
	public function products_for_discount(){
		$sql="SELECT p.ProductID,p.Title,pc.CountryID "
                        . " FROM product AS p JOIN `product_country` AS pc ON(pc.ProductID=p.ProductID) WHERE p.Status=1";
		return $this->db->query($sql)->result();
	}	
	
	public function add_product_discount($dataArr){
		$sql="DELETE FROM `product_discount` WHERE ProductID IN(".$dataArr['ProductID'].")";
		$this->db->query($sql);
		
		$this->db->insert($this->_table_discount,$dataArr);
		return $this->db->insert_id();
	}
	
	public function add_category_discount($dataArr){
		$ProductIDArr=$this->db->select('ProductID')->from($this->_table)->where('CategoryID',$dataArr["CategoryID"])->where('Status','1')->get()->result();
		if(count($ProductIDArr)>0){
			$newArr=array();$batchDataArr=array();
			foreach($ProductIDArr as $k){
				//print_r($k);die;
				$newArr[]=$k->ProductID;
				$batchDataArr[]=array('ProductID'=>$k->ProductID,'DiscountID'=>$dataArr["DiscountID"]);
			}
			
			$this->db->where_in('ProductID',$newArr);
			$this->db->delete($this->_table_discount);
			
			$this->db->insert_batch($this->_table_discount, $batchDataArr); 
		}
		return TRUE;
	}
	
	public function manage_tmp_cart(){
		$countryShortName=$this->session->userdata('USER_SHIPPING_COUNTRY_NAME');
		
		$sql="DELETE FROM ".$this->_tmp_cart." WHERE  IP='".$this->input->ip_address()."'";
		$this->db->query($sql);
		//echo $this->db->last_query();die;
		
		$sql="DELETE FROM ".$this->_tmp_shipping."  WHERE IP='".$this->input->ip_address()."'";
		$this->db->query($sql);
		$this->session->unset_userdata('ShippingSelected');
		$this->session->set_userdata('TotalItemInCart',0);
		$this->session->unset_userdata('IsShipping');
		$this->session->unset_userdata('ShippingID');
		
		$this->session->unset_userdata('OrderDetails');
		$this->session->unset_userdata('OrderID');
		$this->session->unset_userdata('PaymentThanksPageOrderID');
		
		return TRUE;
	}
	
	public function manage_tmp_cart1(){
		$countryShortName=$this->session->userdata('USER_SHIPPING_COUNTRY_NAME');
		
		$sql="DELETE FROM ".$this->_tmp_cart." WHERE PurchaseLocation <> '".$countryShortName."' AND IP='".$this->input->ip_address()."'";
		$this->db->query($sql);
		//echo $this->db->last_query();die;
		
		$sql="DELETE FROM ".$this->_tmp_shipping." WHERE PurchaseLocation <> '".$countryShortName."' AND IP='".$this->input->ip_address()."'";
		$this->db->query($sql);
		return TRUE;
	}
	
	
	public function show_country_wise($Title,$CategoryID){
		//$sql="SELECT pd.* FROM `product` AS p JOIN `product_country` AS pd ON p.ProductID=pd.ProductID WHERE p.Title='".$Title."' AND pd.CountryID IN('1','240','99') ORDER BY pd.CountryID";
                $this->db->select('pd.*');
                $this->db->from('product p');
                $this->db->join('product_country pd','p.ProductID=pd.ProductID');
                $this->db->where('p.Title',$Title);
                $this->db->where('p.CategoryID',$CategoryID);
                $this->db->where_in('pd.CountryID',array(1,240,99));
                $this->db->order_by('pd.CountryID','ASC');
                
                //echo $this->db->last_query();die;
		return $this->db->get()->result();
	}
	
	public function copy_tag($ProductID,$NewCopyProductID){
		$OldTagArr=$this->db->select('*')->from($this->_table_tag)->where('ProductID',$ProductID)->get()->result();
		$BatchArr=array();
		$TmpArr=array();
		foreach($OldTagArr AS $k){
			$TmpArr=array('ProductID'=>$NewCopyProductID,'TagID'=>$k->TagID);	
			$BatchArr[]=$TmpArr;
		}
		$this->db->insert_batch($this->_table_tag,$BatchArr);
		//echo $this->db->last_query();die;
		return TRUE;
	}
	
	public function get_popular_store(){
		$CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
		$sql="SELECT p.*,pi.Image,c.CategoryName,dis.Amount,c.isAddToCart "
                        . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                        . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                        . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                        . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                        . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                        . " WHERE p.Status=1 AND c.Status=1 AND pc.CountryID='".$CountryID."' AND c.PopularStore=1 ORDER BY p.ProductID DESC";
		return $this->db->query($sql)->result();
	}
	
	public function get_recent_deals(){
		$CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
		$sql="SELECT p.*,pi.Image,c.CategoryName,dis.Amount,c.isAddToCart "
                        . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                        . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                        . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                        . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                        . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                        . " WHERE p.Status=1 AND c.Status=1 AND pc.CountryID='".$CountryID."' AND p.Deals=1 ORDER BY p.ProductID DESC";
		return $this->db->query($sql)->result();
	}
	
	public function get_recent_product($PerPage=0,$PageNo=0){
		$CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
		$sql="SELECT p.*,pi.Image,c.CategoryName,dis.Amount,c.isAddToCart "
                        . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                        . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                        . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                        . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                        . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                        . " WHERE p.Status=1 AND c.Status=1 AND pc.CountryID='".$CountryID."' AND p.isNew='1' ORDER BY p.ProductID DESC,p.DealPriceUpdateTime DESC";
                if($PerPage>0){
                    $sql.=" LIMIT $PageNo,$PerPage";
                }
		return $this->db->query($sql)->result();
	}
        
        public function get_recent_product_total(){
		$CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
		$sql="SELECT p.*,pi.Image,c.CategoryName,dis.Amount,c.isAddToCart "
                        . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                        . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                        . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                        . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                        . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                        . " WHERE p.Status=1 AND c.Status=1 AND pc.CountryID='".$CountryID."' AND p.isNew='1' ORDER BY p.ProductID DESC,p.DealPriceUpdateTime DESC ";
                
		$arr=$this->db->query($sql)->result();
                return count($arr);
	}
	
	public function get_featured(){
		$CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
		$sql="SELECT p.*,pi.Image,c.CategoryName,dis.Amount,c.isAddToCart "
                        . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                        . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                        . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                        . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                        . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                        . " WHERE p.Featured='1' AND c.Status=1 AND p.Status='1' AND pc.CountryID='".$CountryID."' ORDER BY p.ProductID";
		return $this->db->query($sql)->result();
	}
        
        public function update_cancel_quantity($ProductID,$Qty){
            $dataArr=  $this->db->select('Quantity')->from($this->_table)->where('ProductID',$ProductID)->get()->result();
            $UpdateArr=array('Quantity'=>($dataArr[0]->Quantity+$Qty));
            $this->edit($UpdateArr, $ProductID);
            return TRUE;
        }
        
        public function search($search_text,$CategoryID){
            $CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
            $sql="SELECT p.*,pi.Image,c.CategoryName,dis.Amount,c.isAddToCart "
                    . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                    . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                    . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                    . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                    . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                    . " WHERE p.Status=1 AND c.Status=1 AND pc.CountryID='".$CountryID."'";
            if($CategoryID>0){
                $sql .= "AND p.CategoryID='".$CategoryID."' ";
            }
            
            $sql .= " AND p.Title LIKE('%".$this->db->escape_like_str($search_text)."%') ORDER BY p.ProductID DESC,p.DealPriceUpdateTime DESC";
		return $this->db->query($sql)->result();
        }
        
        public function get_all_tag(){
            return $this->db->select('*')->from($this->_tag)->order_by("TagID", "desc")->get()->result();
        }
        
        public function get_product_list_by_tag_id($TagID){
            $CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
            $sql="SELECT p.*,pi.Image,c.CategoryName,dis.Amount,c.isAddToCart "
                    . " FROM product_tag AS pt JOIN product AS p ON(pt.ProductID=p.ProductID) "
                    . " JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                    . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                    . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                    . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                    . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                    . " WHERE p.Status=1 AND c.Status=1 AND pc.CountryID='".$CountryID."' AND pt.TagID='".$TagID."' ORDER BY p.ProductID DESC,p.DealPriceUpdateTime DESC";
		return $this->db->query($sql)->result();
        }
        
        public function update_tag_state($TagID,$DataArr){
		$this->db->where_in('TagID',explode(',',$TagID));
		$this->db->update($this->_tag,$DataArr);
		return TRUE;
	}
        
        
        public function get_top_category($CategoryID){
            //echo '$CategoryID = '.$CategoryID;
            $sql="SELECT CategoryName,ParrentCategoryID,CategoryID "
                    . " FROM `category` WHERE `CategoryID`=(select `ParrentCategoryID` from category where `CategoryID`=$CategoryID)";
            //echo $sql;die;
                $rs=$this->db->query($sql)->result();
            //echo '<pre>';print_r($rs);//
            if($rs[0]->ParrentCategoryID>0){
                $sql1="SELECT CategoryName,ParrentCategoryID FROM `category` WHERE `CategoryID`='".$rs[0]->ParrentCategoryID."'";
                //echo $sql1; //die; 
                $rs1=$this->db->query($sql1)->result();
               // echo '<pre>';print_r($rs1);die;
                return strtolower($rs1[0]->CategoryName);
            }else{
                return strtolower($rs[0]->CategoryName);
            }       
        }
        
        function get_product_image_for_download($ProductIDs){
            $sql="SELECT pi.Image FROM `product` AS p JOIN `product_country` AS pc ON(p.ProductID=pc.ProductID) LEFT JOIN `product_image` AS pi 
                 ON(p.ProductID=pi.ProductID) WHERE p.ProductID IN($ProductIDs)";
            return $this->db->query($sql)->result();
        }
        
        function get_deal_product_by_category($CategoryID){
            $CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
            if($CategoryID>0){
                $sql="SELECT p.*,c.ParrentCategoryID,pi.Image,c.isAddToCart FROM product AS p JOIN category AS c ON(p.CategoryID=c.CategoryID ) "
                        . " JOIN product_image AS pi ON(pi.ProductID=p.ProductID) JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                        . "  WHERE pc.CountryID='".$CountryID."' AND p.Status=1 AND p.Deals=1 ORDER BY p.DealPriceUpdateTime DESC LIMIT 0,1";
            }else{
                $sql="SELECT p.*,'TOPCat' AS ParrentCategoryID,pi.Image,c.isAddToCart FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                        . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) WHERE Status=1 AND Deals=1 ORDER BY DealPriceUpdateTime DESC LIMIT 0,1";
            }
            //echo $sql;die;
            return $this->db->query($sql)->result();
        }
        
        function get_products_by_category_only($CategoryID,$PerPage=4,$PageNo=0){
            $CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
            $sql="SELECT p.*,pi.Image,c.CategoryName,dis.Amount,c.isAddToCart "
                    . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                    . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                    . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                    . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                    . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                    . " WHERE p.Status=1 AND c.Status=1 AND pc.CountryID='".$CountryID."' AND p.CategoryID=$CategoryID ORDER BY p.ProductID DESC,p.DealPriceUpdateTime DESC";
            if($PerPage>0){
                $sql.=" LIMIT $PageNo,$PerPage";
            }
            return $this->db->query($sql)->result();
        }
        
        
        function get_products_by_all_category_only($CategoryID,$PerPage=4,$PageNo=0){
            $CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
            $sql="SELECT p.*,pi.Image,c.CategoryName,dis.Amount,c.isAddToCart "
                    . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                    . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                    . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                    . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                    . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                    . " WHERE p.Status=1 AND c.Status=1 AND pc.CountryID='".$CountryID."' AND p.CategoryID IN(SELECT c1.CategoryID FROM `category` AS c1 where c1.ParrentCategoryID=$CategoryID) ORDER BY p.ProductID DESC,p.DealPriceUpdateTime DESC";
            if($PerPage>0){
                $sql.=" LIMIT $PageNo,$PerPage";
            }
            //echo $sql;die;
            return $this->db->query($sql)->result();
        }
        
    function set_deal($dataArr){
        $this->db->insert($this->_table_deal,$dataArr);
        return $this->db->insert_id();
    }
    
    function remove_deal($dataArr){
        $this->db->where_in('ProductID',$ProductID);
        $this->db->delete($this->_table_deal);
        return TRUE;
    }
    
    function edit_deal($ProductID,$CategoryID,$RegionID){
        $this->db->where('RegionID',$RegionID);
        $this->db->where('CategoryID',$CategoryID);
        $this->db->update($this->_table_deal,array('ProductID'=>$ProductID));
        //echo $this->db->last_query();die;
        return TRUE;		
    }
    
    function get_deal($CategoryID=0){
        $this->db->cache_off();
        $CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
        if($CategoryID>0){
            $sql="SELECT p.*,pi.Image"
                    . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                    . " JOIN product_deal AS pd ON(pd.ProductID=p.ProductID) "
                    . " JOIN category AS c ON(c.CategoryID=p.CategoryID) "
                    . " WHERE p.Status=1 AND pd.RegionID='".$CountryID."' AND pd.CategoryID=$CategoryID AND c.isAddToCart=1 ORDER BY rand() LIMIT 1";
        }else{
            $sql="SELECT p.*,pi.Image"
                    . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                    . " JOIN product_deal AS pd ON(pd.ProductID=p.ProductID) "
                    . " JOIN category AS c ON(c.CategoryID=p.CategoryID) "
                    . " WHERE p.Status=1 AND pd.RegionID='".$CountryID."' AND c.isAddToCart=1 ORDER BY p.DealPriceUpdateTime DESC LIMIT 0,5";
        }
        //echo $sql;die;
        return $this->db->query($sql)->result();
    }
    
    public function get_product_by_category_max_min($CategoryID,$level=3){
        $CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
        $CateLevel='CategoryID'.$level;
        $sql="SELECT MAX(p.Price) AS MaxPrice,MIN(p.Price) AS MinPrice "
                . " FROM product AS p JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                . "  WHERE p.Status=1 AND c.Status=1 AND p.`".$CateLevel."`='".$CategoryID."' AND pc.CountryID='".$CountryID."'  ";
        return $this->db->query($sql)->result();
    }
    
    function search_result($CategoryID,$SearchProductTitle,$per_page){
        $CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
        $sql="SELECT p.*,pi.Image,c.CategoryName,dis.Amount,c.isAddToCart "
                . " FROM product AS p JOIN product_image AS pi ON(pi.ProductID=p.ProductID) "
                . " JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                . " LEFT JOIN product_discount AS pd ON(p.ProductID=pd.ProductID) "
                . " LEFT JOIN discount AS dis ON(pd.DiscountID=dis.DiscountID) "
                . " WHERE p.Status=1 AND c.Status=1 AND pc.CountryID='".$CountryID."' AND p.CategoryID1=$CategoryID AND p.Title LIKE '%".$SearchProductTitle."%' ORDER BY p.ProductID DESC,p.DealPriceUpdateTime DESC";
            $sql.=" LIMIT 0,$per_page";
        return $this->db->query($sql)->result();   
    }
    
    
    function get_max_min_for_search($CategoryID,$SearchProductTitle){
        $CountryID=$this->session->userdata('USER_SHIPPING_COUNTRY');
        $sql="SELECT MAX(p.Price) AS MaxPrice,MIN(p.Price) AS MinPrice "
                . " FROM product AS p JOIN product_country AS pc ON(pc.ProductID=p.ProductID) "
                . " JOIN category AS c ON(p.CategoryID=c.CategoryID) "
                . " WHERE p.Status=1 AND c.Status=1 AND pc.CountryID='".$CountryID."' AND p.CategoryID1=$CategoryID AND p.Title LIKE '%".$SearchProductTitle."%' ";
        //echo $sql;die;
        return $this->db->query($sql)->result();   
    }
    
    function is_exist_deal_for_category($TopCategoryID,$RegionID){
        $rs=$this->db->from($this->_table_deal)->where('RegionID',$RegionID)->where('CategoryID',$TopCategoryID)->get()->result();
        if(count($rs)>0)
            return TRUE;
        else
            return FALSE;
    }
}
