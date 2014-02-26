
#include "hwc.h"


int _hwcdev_layer_config_3d(int disp, __disp_layer_info_t *layer_info)
{
    return 0;
}

int _hwc_device_set_backlight_mode(int disp, int mode)                   
{                                                                                            
    SUNXI_hwcdev_context_t *ctx = &gSunxiHwcDevice;
    unsigned long arg[4]={0};

    if(disp == HWC_DISPLAY_PRIMARY)
    { 
        arg[0] = 0;  
        if(mode == 1)                                                                              
        {                                                                                          
            return  ioctl(ctx->disp_fp,DISP_CMD_DRC_ON,arg);                                       
        }                                                                                          
        else                                                                                       
        {	                                                                                         
            return ioctl(ctx->disp_fp,DISP_CMD_DRC_OFF,arg);                                       
        } 
    }                               

    return 0;                                                                                
}                                                                                            

int _hwc_device_set_backlight_demomode(int disp, int mode)               
{                                                                                            
    SUNXI_hwcdev_context_t *ctx = &gSunxiHwcDevice;
    unsigned long arg[4]={0};
    __disp_rect_t window;                                                                     

    if(disp == HWC_DISPLAY_PRIMARY)
    { 
        arg[0] = 0; 
        window.x = 0;                                                                             
        window.y = 0;                                                                             
        window.width = ioctl(ctx->disp_fp,DISP_CMD_SCN_GET_WIDTH,arg);                          
        window.height = ioctl(ctx->disp_fp,DISP_CMD_SCN_GET_HEIGHT,arg);  
        if(mode == 1)                                                                              
        {                                                                                          
            window.width /= 2;                                                                      
            arg[1] = (unsigned long)&window;                                                       
            return ioctl(ctx->disp_fp, DISP_CMD_DRC_SET_WINDOW,arg);                                       
        }                                                                                          
        else                                                                                       
        {	                                                                                         
            arg[1] = (unsigned long)&window;                                                       
            return ioctl(ctx->disp_fp, DISP_CMD_DRC_SET_WINDOW,arg);                                       
        } 
    }                                                                                                                      
    return 0;                                                                                 
}                                                                                            

int _hwc_device_set_enhancemode(int disp, int mode)          
{                                                                                            
    SUNXI_hwcdev_context_t *ctx = &gSunxiHwcDevice;
    unsigned long arg[4]={0};

    if(disp == HWC_DISPLAY_PRIMARY)
    { 
        arg[0] = 0;  
        if(mode == 1)                                                                              
        {                                                                                          
            return  ioctl(ctx->disp_fp,DISP_CMD_ENHANCE_ON,arg);                                       
        }                                                                                          
        else                                                                                       
        {	                                                                                         
            return ioctl(ctx->disp_fp,DISP_CMD_ENHANCE_OFF,arg);                                       
        } 
    }                               

    return 0;
}                                                                                            
                                                                                             
int _hwc_device_set_enhancedemomode(int disp, int mode)      
{ 
    SUNXI_hwcdev_context_t *ctx = &gSunxiHwcDevice;
    unsigned long arg[4]={0};
    __disp_rect_t window;                                                                

    if(disp == HWC_DISPLAY_PRIMARY)
    { 
        arg[0] = 0;                                                                    
        window.x = 0;                                                                          
        window.y = 0;                                                                          
        window.width = ioctl(ctx->disp_fp,DISP_CMD_SCN_GET_WIDTH,arg);                       
        window.height = ioctl(ctx->disp_fp,DISP_CMD_SCN_GET_HEIGHT,arg);                     
        if(mode == 1)                                                                              
        {                                                                                          
            window.width /= 2;                                                                  
            arg[1] = (unsigned long)&window;                                                   
            return ioctl(ctx->disp_fp,DISP_CMD_SET_ENHANCE_WINDOW,arg);                                       
        }                                                                                          
        else                                                                                       
        {	                                                                                         
            arg[1] = (unsigned long)&window;                                                   
            return ioctl(ctx->disp_fp,DISP_CMD_SET_ENHANCE_WINDOW,arg);                                       
        } 
    }                               

    return 0;                                                                                           
} 

int _hwc_device_set_output_mode(int disp, int out_type, int out_mode)
{
    SUNXI_hwcdev_context_t *ctx = &gSunxiHwcDevice;

    if (ctx->out_type[1] == out_type && ctx->out_mode[1] == out_mode) {
        return 0;
    }

    if (disp == HWC_DISPLAY_PRIMARY && ctx->hint_hdmi_mode != out_mode) {
        ctx->hint_hdmi_mode = out_mode;
        if (ctx->hdmi_hpd_active != 0) {
            ctx->hdmi_hpd = 0;

            usleep(1000 * 500);
            ctx->hdmi_hpd = 1;
        }
    }

    return 0;
}
