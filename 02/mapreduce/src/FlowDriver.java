import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;


public class FlowDriver {

    public static void main(String[] args) throws Exception {

        //1.获取配置信息
        Configuration conf = new Configuration();
        Job job = Job.getInstance(conf);

        //2.获取jar包信息
        job.setJarByClass(FlowDriver.class);

        //3.配置mapper、reducer类
        job.setMapperClass(FlowMapper.class);
        job.setReducerClass(FlowReducer.class);

        //4.配置mapper输出key、value值
        job.setMapOutputKeyClass(Text.class);
        job.setMapOutputValueClass(FlowBean.class);

        //5.配置输出key、value值
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(FlowBean.class);

//		//设置分区
//		job.setPartitionerClass(FlowPartitioner.class);
//
//		//设置Reducenum,依据是看flowpartitioner里分了几个区
//		job.setNumReduceTasks(5);

        //6.配置输入路径和输出路径
        FileInputFormat.setInputPaths(job, new Path(args[0]));
        FileOutputFormat.setOutputPath(job, new Path(args[1]));

        //7.提交
        boolean result = job.waitForCompletion(true);
        System.exit(result?0:1);
    }
}

