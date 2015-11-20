using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Apache.NMS;
using Apache.NMS.ActiveMQ;
using System.Text;

namespace waiterPlatform.UI
{
    public partial class test : System.Web.UI.Page
    {
        private IConnectionFactory factory;

        protected void Page_Load(object sender, EventArgs e)
        {
            factory = new ConnectionFactory("tcp://localhost:61616");
            //通过工厂建立连接
            using (IConnection connection = factory.CreateConnection())
            {
                //通过连接创建Session会话
                using (ISession session = connection.CreateSession())
                {

                    //通过会话创建生产者，方法里面new出来的是MQ中的Queue
                    IMessageProducer prod = session.CreateProducer(new Apache.NMS.ActiveMQ.Commands.ActiveMQQueue("firstQueue"));
                    //创建一个发送的消息对象
                    ITextMessage message = prod.CreateTextMessage();
                    //给这个对象赋实际的消息
                    message.Text = "发送一号";
                    //设置消息对象的属性，这个很重要哦，是Queue的过滤条件，也是P2P消息的唯一指定属性
                    //message.Properties.SetString("filter", "demo");
                    //生产者把消息发送出去，几个枚举参数MsgDeliveryMode是否长链，MsgPriority消息优先级别，发送最小单位，当然还有其他重载
                    prod.Send(message, MsgDeliveryMode.NonPersistent, MsgPriority.Normal, TimeSpan.MinValue);
                }
            }
        }
    }
}