# ImageToJavaScript
Will convert images in a folder to a single javascript output file, which includes the base64 strings per file. That can be used to change the "img" > "src" attribute, to use that base64 string instead of a direct file. Maybe good for standalone HTML files.

# Usage
Just copy the ImageToBase64.ps1 file to your images folder and run it at this location from the cmd or per click. It will generate a JavaScript file, which can be included ( or copy&paste ) to you HTML files.

# Example of HTML usage
Run the script and copy the output to you HTML part like this.

```html
...
<body>
  
  <!-- Example Image to use for example -->
  <img id="example-image" src="" alt="" />
  
  <script type="text/javascript">
    
    // Content from the converter ( this data is from an image, that i created on my computer )
    var ImageBlueComment40 = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAoCAYAAACWwljjAAAACXBIWXMAAADlAAAA5QGP5Zs8AAAFVklEQVRYhdVYb0wbZRj/3dFSKC0FVmCQsg238EchSMRhxrKODxMj0zHxb5aZin4QJYbp+GAWZWzBmAUDW5ZscR9W4xJM1KiELTNumWDcxiADlMgkZvxZYVbqRoGWHm3vzHtcy9q7thyDBH9J07vnfe65X5/397593ofiOA7LBWW25AI4DkALwAqghTMZfl52QBJzOYQosyUZwKcAqiSGfwBQy5kMI6tOiDJbaADvAmgUshIKdpItIWNTcgjRMn/AVwBORCBDoANQD+B7mfFlE2oSWdh54J9+gJmW8jevKqHiy58lwj5i8xsmf4Px2hls77uAwrajoEc6AS+zMDYz7ir8uk7WdEFKQ4JO3gGwiTMZDvJE9tduUVJoVAAvQxWLjrxylIxcheLfCf6ZOcc0GKcDNE1DkZCC7oIyFAz3gB4bJMMdROQ3z7f2CfFNQuzDEQlRZsuzwtxv9SVl2+WmSiVNVYPjRLrxuOfhcsyAcTlht1kRF5+A2LiQ8jreu3VPMzZu7xc0NiqsxgCd8YQosyVNEOuLASGcVsZ4/UtVcGTW64HLOcsTInDPM7hvHeevFdEqaHVJUKpiRIx6S15hkF4UHI9k0OTbJmjKbNkG4E8RGQJ1qsqzLj3ARIjM2u/5yYiyRshN3sX0fRu8Ho/fTseoIUGGwAhgmDJbKvgM4eyd62RqRG6zEygavYY46zB/O+9ygplzguNYkeuDGQqGRpeEmDjtor6e2AMkZUm5kil8nBAKVLV7FobxLmy+3cvfet3zmHPMgGW9ki+MRIjPTpQCGl0iYtQa/p7dkIv+/N2AOiXYtVQRbDHe+AJg5sCxLGh4ceroh8jbkhHyZXLw3pFmXOnshHJsEIVjg+gtrxOREu9DzBz/NTNlQ0XZ0ytGhuDExwewPlm/qD+3S+QjylAoNJ5uxdDtYclRj9cD54zdf3/4gxoUZGdK+mq08fh70iY5JotQWooemji15BjLsvxetBJYMqGqF3atyAsjgRB6hvjkDLU3a9xMbij/gb/uYHpWOgtkcyXTJoUEbVzI6Svqb4NbpUZ/cVWpYOpTcCbDj+Rqx+u37OH+aetbTmN4RFpD4ZZ97qP5+Kn1jOSY1zrKryru1GKVueQp+/Zk41JdHwpy66FVx5IzVFlzKOyUnfykAcaivIfmq6DMljJykWPI0WncjP+/KxgNtW+HFXVJYY7sl0elbuRFTZktOwVTH8nQRXJ1K2s3bzFaxVUqwUru2D70FDwP6DaQuyuCqTSshr5pb+eX+0rhXNsldHf9GjZaWA05HA5UHzqCRzZK7yM+kD0oP2szqvfthU6zsJt39Ayg5fOzAX6RyEQk5CP1+x8DYX2IqDsuXcB3bW041vCRX9yhCFB06IkRj6hi+S9tgh4KZXQkvgEYt4xi35tvoaa+id+hgxGtikVictpiXKW4zF1zBdqaK2HJlL1P6jFxpHT0PFYJX5EfHaOGNlHPfy8FhMS69RlQa3U8GVLkd++qC0UGwpFoiuZMhqsAsskqF7k4rYzvMOgDSTv51aH0RY5BRCfxiXpEKRbXDEvqpYkeRuIRcgzK9J3PeFFzJsNdzmR4CUA5gBt+V3XqDjeHY6CogAwSTai1CfyHpqP8NpLBpJR0yTMZ30dyu7KFzgiEKdrLmQw7H2zdrO2jdCQ8tf9AWVdR5TnoNul5V9JsGPoFXsc0HPZ76H/yObAZxUCUaqHZcLHltZvnW2W1ZOQ2rMiZvyvASNoxtkFAlwmo4oMfeYMzGWS1ZOTWQwfFEaKBlAIpMgQmmfFlE3qVnPckt4lAEOE2AKiQS+j/3fSUILaybWEA/wG1slkDxsnU7wAAAABJRU5ErkJggg==';

    // Replace the Image-Source (src) with a data uri ( content is stored in the base64 string )
    document.getElementById("example-image").setAttribute("src", ImageBlueComment40);
  
  </script>
  
  
</body>
...
```
